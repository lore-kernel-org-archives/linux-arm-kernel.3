Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F4ECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUAaxA8ixX7Y/N8kqqm6h7zxo1wmIVgs+FOxChZzsgs=; b=CPcyf0AAIrzv16iiPXhPGXQv/A
	KnMAIDQqNROUzC56KvmxQ7KSHekgaEvVoK6LgJhTCTBSv2r118zw2VPG/KK4dTbvBCZiSLLld7xmD
	lvQqkFypeWddtix8/a/tlE5P3F5zOtclB0RwsmBYaSXTOL7CZE7XHAQxBqJJWHnAAsth4X5dQIO21
	uRBMhsfv/A1NoW5YTVbj+0mZr+HQe04Sl32PnNjfpg+rGXMfVfQPG7klpJL05iJlttfC89z0tOgmt
	cyTC4JkowMdGMx9p2tVIbp7Iby/Ne4hw5w4BzRoOQEpAhJOefwZt73/p8gB/YAUKLc9LhlamRYk0n
	swVb0RHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaFD-0000000Cfw5-2Daa;
	Sun, 14 Jun 2026 02:06:39 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaFA-0000000Cfvm-3VDs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 02:06:38 +0000
Received: by mail-qt1-x842.google.com with SMTP id d75a77b69052e-51761d27612so27099421cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 19:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781402795; cv=none;
        d=google.com; s=arc-20240605;
        b=dheTr9B7Nsp6D4uM77niCYFZMMwwo/M15b1UjfhJBq7WDz9qX0FWUYLNak5zDkGFZq
         jpS0nYL7ai8WN984Z+KJdVhK0cSVjIn3E1cAAbbSqbTfW8wz9XR0/IeA25+J/9XSZo3u
         lAVJKxdzSDvuguu4d+LYnfxqUEanWuXc1XxbB06dm6kaZWt8mFH+at9uVo1hnbFoSInx
         hOlBoOVawB5DhquZsHPPwxP0BzVrJD8z4OOloN89+BEMBtirVdSpPjlS6qae6v43CG7X
         bEq5jpPHzTyw3RFLVXsCEwBllGv74qjZKYdmqskcw6W26wAAd5ZxBeCc/TMAn10BcXpy
         6CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUAaxA8ixX7Y/N8kqqm6h7zxo1wmIVgs+FOxChZzsgs=;
        fh=Okt3SrtpSE3eT3Dg4ZmedJCsPaQSoz6g/liXKWTAYOE=;
        b=atRcpbxFyefBo8cT9j5obmJBhJ88wAb62sHcrL/Ovl6bfjwsAlbQMmj/08R4Yk0KyC
         CFB9sHRECR0hg9ZBqrU7mDTsOKTFYEjm7kdd6yNaJ4zjBKQ8+prUpDBZZchzguY2WVXA
         zRhQOUOzusBOIzba36OZTJEaWkQyr7e/zEiXVt9Ct/l1yuKQHkeQyiuF4AYBgzgtzoVx
         htX/mLsA03ecHW3cj+e/eIHp8Fxb6E9ICL9frYYs0SVqk0g1BydVGZ4HVsRS/z3xmbiR
         AfX/tNJ0orYC9+IZS3LowkdD5gRAnCJxLnU3lB7fnXGMHPWYZLs1yDrlBjc4P6SqrUNQ
         Oxig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781402795; x=1782007595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUAaxA8ixX7Y/N8kqqm6h7zxo1wmIVgs+FOxChZzsgs=;
        b=Zm2CXa/RPIOBt8lDC0qlWa4uaSJf85+cbTlA7aK33oBbh44cggbMs+iDxCyIIyZneU
         eOl7kqkQTAuGVknyyB2vudKiAbzyDlg02rFwp/A3zAF5hRSbrJ9QqUP54PLqqfSDISTn
         YPXUFo+jO245uYcSw2ROnnA792JX5iELGb+BbijQv7VEmIUo7S6rZoCIfCERezRNKFi1
         K+uht+0g+st9ZkYT1FjWS9GK/e0OKqeC7mawTOFoygkIzwsDyAVhm1LB9AJp32c1Ni5f
         WgAyHeY56jTdgJJnVNApWuGCNrKpOV6YNC/zVRM2sx2E6suvFPqgB0wwyPUNuSjI1WGe
         b8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781402795; x=1782007595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUAaxA8ixX7Y/N8kqqm6h7zxo1wmIVgs+FOxChZzsgs=;
        b=oaSjDSXSrZWdt/Xd5bRmSD7Ybh3psLN/OM02rF7OyB+MEr9NDp3ZkjWAPRdfy7JXRr
         gFmaDNn8pknHVGIxT++zHRNtoxUwa8u/e8rj35/mayAo7FMiBNOrPz7HvCog0p7pu8C/
         iVE0ZNZVxFQHV/V0iDe9fyVJOMix0vmwHs17tAcrO93oUeWXJZlcD09yq0U1/VTzLPKt
         F9/6Pn9AKgtEqc5ggUevSSm6vb8mD1YpCd11CXPjAWZmFCAJEaUB5PKAsG93H8wt0s3s
         A+QM2Rnfm3Bd4X+xEiirno9PIe6zt4MI6wL7hreVQoBT/z2yjj2TvH0XtDeI8NWkk19g
         bNZA==
X-Gm-Message-State: AOJu0YzQoVIhstqlb4mCaxQNsYgBKzy/fKRIU08dP953jRQqxoslbbbd
	nqI8i+PODhotVhLJqXaXg7rtGBQSc8WcaUUjFE27Z0hhYBjDZyzjWpTlKIt8yweSadKH54boW0O
	Z5ukfnxtQJV+rw3bw1cyv+1E1saLNVArNhleuGiM=
X-Gm-Gg: Acq92OEZs2CXPWtaHm0VYZ9AE8rR4a+Z6DH9YpbFserytQ2Z5QUnlboeeW+0BRp0fNI
	o0QYZ/U5u3moyQUNrpwxYJKTHuTLJaVgJMgtFlSupfUhvMK7of6vsXWGQy+SmG2m0UgTORLlwmP
	dVPEoA1E5ESOtnN+UD9RcE4n2FBJuPhJSE3NfmRucxDfghZxpEBzfQEJSw6+0pHxbIEhBK6PkEz
	OiAFgEkyd7/RzSTzIBKhRy2goTDfePzDuBGUkJP/SJwJRVOGGFMq1ID2MoHw1EaVToeNjfaQOYt
	3Hr9q7gZDQUAAmQ7Zll5yTG+R/SjWPhg1gNfbMFRhmcY/qg5lbpXiWxmk0hBt0+pRIep3Q==
X-Received: by 2002:a05:6214:5502:b0:8aa:a025:78e3 with SMTP id
 6a1803df08f44-8d32b56fbd6mr139591116d6.6.1781402795262; Sat, 13 Jun 2026
 19:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260611004700.395759-1-enelsonmoore@gmail.com> <CAD++jLnD2EU=YfABb1ySRtgeOPVzQKH3iMjZtj2AsW+RK8M6mQ@mail.gmail.com>
In-Reply-To: <CAD++jLnD2EU=YfABb1ySRtgeOPVzQKH3iMjZtj2AsW+RK8M6mQ@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 13 Jun 2026 19:06:24 -0700
X-Gm-Features: AVVi8CfZrPrFN4vrTl8IkxdlJLQGxdmxjT-4oj4r_cbFzFWN1Y2uJPRe9XL4u9Q
Message-ID: <CADkSEUgH+Q6hJ+A-G_tpDz6A=QRRv85eVgu2eXDVY4ouvge0fg@mail.gmail.com>
Subject: Re: [PATCH] ARM: remove references to removed CONFIG_CPU_ARM92x_CPU_IDLE
 options
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_190636_878492_AFE9D650 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, Jun 11, 2026 at 5:38=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
> Please put this patch into Russell's patch tracker.

Here:
https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D9478/1

Ethan

