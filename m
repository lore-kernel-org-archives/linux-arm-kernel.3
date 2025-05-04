Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D789C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=; b=EvlMGleLVnRXWj3T4TsLXq0v8K
	wQsBIj51TKKOShiOqIsjjOKswoCsU5e9Cqc8g2MyyIu4oDlwQ+NU9j4EwV0FOXMlcfJaPsmys492Q
	oCIB1lz2haGbNchQF4w24IsISC+n5AMw44DEjPpJFQf1QUp2zE08CCDMljQQsHzIeIKsvDWrzRzJP
	9wIthcN2mnlrCn5wIIH5aIDSP53J7qBUQ4SAxOC700NO4bWoyNxvzug+A5HTOFcoQ7aEbXlsTze2i
	NSTd/LyyU/BhkkW4syNbXPVYMDtlrsIqe5ZqlPxhj69Ac/lqPd3CpEJ/HyEFSqha+NmZIQ6v39Ma8
	Ll8RRaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgdI-00000005xxT-46XZ;
	Sun, 04 May 2025 21:12:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgaP-00000005xdt-1yWB;
	Sun, 04 May 2025 21:09:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2241053582dso56143095ad.1;
        Sun, 04 May 2025 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392960; x=1746997760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=f1sUTUS8Hkwfk3z7uwwF0wjOzZv0+ZW3sLBnS7va56ELYKIWjAeGevU9SjHP9pwoEp
         j74WqvsWVcKgvd8P3Cl8DYtDubkZwaAbsNtiXFhTBKsBmZY9kFT3FxWMiZounyhfwBGu
         Mz0CfVljYxkFb4T7TsZqcWNGt56ID7GWn+YkRNTHGkXDyzzXH9wSxpPG34HrrZfxQL7c
         XcchrjztHtAHOgdpRbNhjc0q9/63WWdzgFGKAL2U7nrz9nfJWQy5yAJHnJJG3itMGCPN
         8QuFXU57XfO3RQvLjPTn4uisbXNwYhYSvGI2ARSSVsb8/5AGaBUpTlvQ8HkCT6KSph6Z
         HK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392960; x=1746997760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=lyHvQVHMIhJlHYTWxLl06kB08JuvgzLIr0C+pZ7uZ3CL7raiwWAt07YG/oZ0/x9+gv
         cqSxWU9TkAVunOEU/c8IT9H4mXZNNghK2yhs3yCh2ywrdRfkkXU5ixWt5SxSvTEkTO+o
         2w+gurNg3ZsvlBDqiSNZexZXvWHUDtGwDnYBhPOe7DpTn/MkLB7af0x+94l+JgM3txSn
         Be4KkujNfyMxN9lB8icH0ru/FBuknWgzy8Oup0FhI9qWlqyeBcncOZQ1I6hql/MimQVv
         FHprjy99umgF8eXbxHrfzN32vsFYhYJY4uuN0//WTPkiUdB3dZdWsaZS4CVrnJ9rYYwF
         SHEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8lQdxwuLykLw4vUeipTbsjewKL6lsbr/r3tT9Q5xY5NDWG8tHUVUsEqFb+oVh6zTWmXSk+/O6k32CusM6kqTw@lists.infradead.org
X-Gm-Message-State: AOJu0YxZSY9bS6cwM8bpI4NgCxBf4529vViDD+ya9h6xYyd5vohP8Mjt
	0B+MsvjHZfHoBEuTfqKxX5fM1Tgfy4WTJRbP9Na+fb0j3VMMtPSRfGLxgopPVlIrwLQZXZ1QPQR
	bLUC9OHsHEnoGtPq4FnO+PPd/EJk=
X-Gm-Gg: ASbGncvaf0PhVkP468FZOv7y/3YaWnklvWX6DmVvqUh/jXz89J8AGhfO0iBpGm4OXMM
	9FzABp2V/GPxydAQYM8EK2RV+Z7yB5rvNNnmsKttdWwD9picbZAsOb1o1OcWFcPCyReNmqPE1om
	zWqktoAG251qLNWA17pjKg7o5/2Dc8zWUtCv6Ic67aeQ90Ej3fcUheeCA=
X-Google-Smtp-Source: AGHT+IEyQ8Cn4QAYZf+y84T7uCSwNBjwsnr+WPyy9pwHvrfCp2EP9RKPuRWxICK3yBH7elJzirFItrsmdm3FGbNjikM=
X-Received: by 2002:a17:902:f541:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22e1ea96542mr80783075ad.40.1746392960457; Sun, 04 May 2025
 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl> <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org> <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
In-Reply-To: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:09:09 +0200
X-Gm-Features: ATxdqUFTzdLXr8lgfVVRwynOfAK5_xWM8dvz6TKO1bT-XzLgIOntX4SmbjH_alg
Message-ID: <CAFBinCDxhx6siM0woQCJwr2J_SJNJq9gKYm2qLu8W=bN4DWj8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: neil.armstrong@linaro.org, linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140921_507025_5F169D0A 
X-CRM114-Status: GOOD (  24.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 22, 2025 at 9:23=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> > On 19/04/2025 23:32, Martin Blumenstingl wrote:
> >> Hi Martijn, Hi Neil,
> >>
> >> On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> =
wrote:
> >>>
> >>> Hi Martin,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> I encountered this issue some time ago as well and had a possible fix=
 in my tree (see
> >>> below).
> >>> My apologies for not upstreaming it earlier.
> >> No worries, we're all busy with both, offline and online life ;-)
> >>
> >>> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=
=80=94it is somewhat simpler. It
> >>> did make the assumption that only  calling component_unbind_all() was=
 at fault and the the rest of the
> >>> code was correct. Therefore, calling one of the following functions:
> >>> meson_encoder_dsi_remove()
> >>> meson_encoder_hdmi_remove()
> >>> meson_encoder_cvbs_remove()
> >>> in case their counterpart was not called, should not result in any is=
sues.
> >>>
> >>> I just verified, and, as far as I understand, all of these functions =
do a check to confirm
> >>> whether the encoder was initialized before proceeding with cleanup.
> >> Yep, that seems to be the case right now.
> >> Neil, would you like Martijn's more simple approach with a Fixes tag
> >> and backport that?
> >> Then I'd send my patch as a small cleanup which doesn't have to be
> >> backported. Otherwise I'd spin a v2 with a fix for the issue that
> >> Martijn found (and including Anand's Reviewed/Tested-by)?
> >
> > Please send a follow-up, I'll apply this one today.
> >
>
> Yeah finally please split this in two:
> - patch 1 that can be backported
Martijn, I still haven't found the time to send a small patch that can
be easily backported.
If you want to submit your version of the patch: please go ahead!
Otherwise I'll need to find some time next week.


Best regards,
Martin

