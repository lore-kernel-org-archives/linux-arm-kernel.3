Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e81hWutsLUVTbqCvfJFaNFyyZMm2S/O9LJi7D6VMUY0=; b=0LfLrsbgFVC8JJ9cL01mk42E4R
	vZPbPPVT39245rqSjqd1gVoA0jjLmfJIvUtiCnDHNGd7zYoK8aPjfQGvuhUUr0BBMq4xjc2B8FjTD
	2bBbCd6N0zx1TTSiUytztj+OkopMHkv5B9lmWvCPRq9qTrEkaaGs5JYUGHIZA4Dj5QSIIcljU3NUf
	PWqDFhC5EY/8ju8KSl0/+T1xMfFpXFd/2YyqRMrqGU9YWNECsuW5XbRhEu0Dm2towFfwNRnQcGl5x
	2naYU9K2yqRRIGItNlBfRfLO1lzXnATrhXAArT7tLaU0eXcI7YbJv3Etn37bH/z7dp9Vg8qPRkApd
	XuVsdMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treOJ-00000002yon-40TK;
	Mon, 10 Mar 2025 14:46:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd0x-00000002lQ9-0NjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:17:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e7fd051bso3817470a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612669; x=1742217469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e81hWutsLUVTbqCvfJFaNFyyZMm2S/O9LJi7D6VMUY0=;
        b=bhElOdLQtn0KiTxHC5Q7TpdlPbxdUSh0pgPXhQSI4wKTocf7A/KubfbPyh7kGxZFFT
         5DXjDE/hmqWEja+t08JUQz7TXsZebQSZ2qioQC76dafrpHJwFTZzZEu60aWoEjzIpljI
         I/tXDWEA90VuRZK/MUIqbmPfpEbd0CaribFC+ua6RITQdc4733pYJA41yBmGLJ1SBy0q
         zUUt+JWGfH0gyKwN+sbrdtPUUQlpMnjQUyk7pSaXoP0smMXNDCIcvwrcR8waQAOehiW1
         g7lqggdP46OSIB849f2MbZgTW9/n3NyKooXM3BU/5baUnhS4x7ChWfjTyEyO0xVxGOOD
         FLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612669; x=1742217469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e81hWutsLUVTbqCvfJFaNFyyZMm2S/O9LJi7D6VMUY0=;
        b=naJbx6yBPt0qg1Puey7xHTEtyAaoFpd+7funtoe3PMyfi/IHlV9S59vKWVHIDQZ/J+
         OndxH1octk843C56IYYwpRNblk5rMMtjt9VjJEnZa0G5O6F4WhVpfDwN8kfZml6LnLtN
         u6sclA5bPGWO3DFhThh+LX4SdZ3IqRwqlho6uHBPYZnfo/btkzc3pNdrWyRqR+603yD0
         u/dOEnYhzU8eNwDjFIm0IhjED9n/HkbZXpyE9skb4Dlz3N6K2r87E+zRRQtriyfmeSfY
         bAG6KRw4gYmj5KBNLHQUi49fQjdWoYoXjqn9YOdEwl2QZ50lVkckKtjSATgiVPgIHqIb
         9OMA==
X-Forwarded-Encrypted: i=1; AJvYcCUjuZaleWhRnbAkoa9gPPi/2lhaBFN8xV6XR3UTNu3KhdMN3PAvYRWIBTH0UXLBzsi5X1O8K9E8NfKBqCRlJ1Tm@lists.infradead.org
X-Gm-Message-State: AOJu0YyQrt/sXlZueOD2yggIzQZzXQhKQjvicTV5bsyVJBg5fBrJg8WB
	cKew5uvYCQU3sdX+DW7PtZRb/8DbaKlN/E3hJQmVRkFafLy1YWrfK0kFj640FJLHh49muRmf0xK
	B7UzNiL/vbMwBo9gUVk4xLozdEYbZqcUKSGg=
X-Gm-Gg: ASbGncspePVMAabV1lluWQCg8hoj1LU3Vey3JQTSIaseTHBWJCRa9ZjRJBFnFvH6stS
	Jm2+zIf/m/U0OyRU942fNEa/WTThhrvUObvLmBs1ajhyn6sGPDKMNtqaLjy6dli3b9WwDHK1d5X
	/wX8w3LpiR1mGFIcjrsSp4Yz4KCgnusrmYo/5s2HvD7R8QVMh1yT1tXw4=
X-Google-Smtp-Source: AGHT+IHNxB7jUw7U1sU/YqvDy1jvAc6QAzamEdqe5B5rflGZNx7smc4lFSrtP5k1Y6lgh3In9FvZqyrp1KvyKGAvTYo=
X-Received: by 2002:a17:906:b385:b0:ac1:daba:c6c with SMTP id
 a640c23a62f3a-ac2526df221mr1329698266b.24.1741612669113; Mon, 10 Mar 2025
 06:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 21:17:12 +0800
X-Gm-Features: AQ5f1JqV0EUVop03OzEgZ2BTz5oBdKMCuLbK2kh3Jb2YpPh1RrSVLJOuu0BV0dg
Message-ID: <CAMvTesBG_=Vzwm5DtMcC29DELWvMEhC+XFZhZ=9p7WdiJBSK8Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V features
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com, 
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org, 
	joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de, 
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com, 
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, 
	ssengar@linux.microsoft.com, apais@linux.microsoft.com, 
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com, 
	gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com, 
	muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org, 
	lenb@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061751_131667_0EAB4564 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 27, 2025 at 7:09=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>
> Extend the "ms_hyperv_info" structure to include a new field,
> "ext_features", for capturing extended Hyper-V features.
> Update the "ms_hyperv_init_platform" function to retrieve these features
> using the cpuid instruction and include them in the informational output.
>
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan

