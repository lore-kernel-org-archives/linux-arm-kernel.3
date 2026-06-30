Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=; b=rN8DXJCF7RQ6bPefI8GYOTGGqc
	Ex3Z0AOdGB2Dz/VoJ2OgZljlbzPUoPHK/ztjNQEyVC1w0nt0K/FAb6Q67EzEnc9VgwLqEZbadjKFC
	dShFCXDwb72GuvTx+Gz3w/Uvz4lHhzzbTNwMSvTk8GUBvdcy5RY5AJsZtfCZED+3gATC0wqoDixH7
	nCuVcCicE8xwFeeBAmn4B79sXswCVptYYgLR++KzPtAs+bCK9/unpqzCr887PCUPsUT4IdDU+g5TO
	Uc2K2nadKsia3wn9HvhkFpNwptw5HmnxCOLrdqfm1N1XGEKMKNtzLFl9qzp+Vz5zCAL5ngqlEMMMi
	kLSV1SUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefcF-00000000DO9-3yEl;
	Tue, 30 Jun 2026 21:03:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefcA-00000000DMe-2PEn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 21:03:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3500961e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853408; cv=none;
        d=google.com; s=arc-20260327;
        b=NV1778EY+8oIK8jDA9ijCiNlLs2D/49vs4Y304CgOA4yQilTCai/XQF/CuY9yRfxyJ
         Ftn0kMfrH2WVnM4wvb+7whUQMNbCWyHmb8QE+4wyTACR46407jbc4gkyY4VAVLJZuWfz
         qy8C6nkNoi89FF6zHccLxC05Wff4xiztmegHISNV3BeUcFSc1JT3MXQudDDo1CZV4biL
         tUt0HXrZVNYF1EoK2ybBaXX2pmGSjaaW1eChMmxlbm+6dkav0/5ZRfmKRbpS0FNMDufw
         C3eQ59lZEcUQRV61Q7Hz6Oicw7ZKiZT6lgKFyitBJyjLXUMeW1ZZ/Q3Z+0xd5M62ayuc
         uauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        fh=Me47hmH2WAq6RMMQnxlIoCYmHouWoFXylzwtqDvWFiU=;
        b=o/6fsv5GsGYpeoidwM3xhnjXipSNqnCvgbBPs6TiWko/l2W/zbEmvnQNFQANwRuvAS
         DstjFrdG9afVrvPpYXipWhPR9OsXLs9HAG8tpDRXF4FtLRCSeg+pMvW1hthS4+Kgq2Su
         BG7+2f3L7cs8/zveUdxxNaC2H7F/DlQarmo2sKblTT7mdm6jaW0u+yxeSISdN0ESTOxY
         fsj1GB1CS8C+vsdp7PC1dtLUXpnr+pvdoJPdYIb0qMXwmxEnqKiBVtqhov5l8OK4IBRz
         Pm+9W7T1qXOOfzCnpzEHHjEPktOwPxOhd4gEz0DR1RC7GLWEFDNWZN6rd2oSh+8lw6nM
         7LSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853408; x=1783458208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=sNvxy3mlrxmGLBcEnW13bOdxYrZ/FNKoETClAf5cfB4JANT8s/9UmQ2Y9KgQsmVDF8
         lsVMT7xcLwtqwyVvOV2udAGGTtkLiJfkPtuQPfYpbaRNxFQoG0mX6XRPCv6hjXdH9+c3
         pjlfHTNACB35v0nS5aOcqZOBYtG1/xbaUqSmCIHF3t4ybW0/EaHZmsV3MyHB76SZs9+z
         4Zwhbuz931pB/xsp6U4JtRFMwcv2iA9xzpM8L/QzLgALQSMtxfIa1w64I0f/TClJn/wm
         vL6UnIrIpVC+g/TkeNFIALGZeX+Kkj7mo0LuAqdYW1f8X0zFQLaqlE3HJvS7Y9cvhN0S
         rPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853408; x=1783458208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=qU22MsGQHuCZL9HoV0siGAOJnnMOjZpWtMzlxECKPOSELD9oJszfjEW0gW2njjKFen
         XzzFrxQA9HWJ0IhHl61L6BU5LNQhouKO4UeJarf3jd/HVZ7pK+1eaF83wa4MNalBS3k0
         NcCqKychPmyUNjy1rz92lvOml8VOUTf4fiW2/+9GrnnYr1t4wId6oxtQlSVLCVfh7myt
         SaOjIw9Jn36GeHia5oAuCkjA2m6wlVCriX+ESO4Ug7OVnOwINmWaOISO75NJJAmmmdYB
         nNv6vHaL/cadVQm9YeKUxHJFPNzyQxKVkuyah+lGRqgehyKwtqedaVQCOqXOn12LhN8p
         ptWA==
X-Forwarded-Encrypted: i=1; AHgh+RpC1P/9TABgGgX0BtdnDPHu5jX7E0ifXEeMdHyoMRrZMeEqM5VFWbbq8oNYpkSQP1gsrojxqGTZjBDMof1K86/E@lists.infradead.org
X-Gm-Message-State: AOJu0YyFQviISztSV5eezwzJ0X63Lh9LQ0s8fcESXyRKcmQcDsXJcrfY
	sFXM11LSnLHFaBn26xy6Bp9B5Th1kmrkLjXkDpzn7OVzFAL8tm7D17iYks5Ag24joLLvg8rbRfV
	QboWRkgeaoxYp+HY46EHkk78JSKE5YwE=
X-Gm-Gg: AfdE7cnT6lvDb+EAebLk+EXWEVhDTmiWUhuXeu4jFO9Uxa0EN218ylMCQm71ay4MZSC
	ux9zQd6565lKnt8rozCkDLRB10OKtmdxEaXImCs2A6ys+E/gIvFozxH6c6dy+9EZ2+pwLErwKxz
	oNOIsQ0q5ZkEeBJ9haCj36dkOZOvtpL/r4+RVJhW+BIMtpVyEXGqD6GGpdwtrhVZlkzd0Ga2bjl
	eYDnAJkVdm2R6ZW6YQx2zAZjB82nX3izSN/3pumUdcPiWputHoZsUnGVcQY0hbi/+biXj0FKyrK
	X7nGelmyRoXF/o5OaKy9SHsfAnV770uEzIvF9mZ9w0SsaA5yMYRt9rPXbGmxI+np3sHDjp6F6BL
	sJ1LvbS7kdzDJYh2J0bRl5YOyues=
X-Received: by 2002:a05:6512:618c:b0:5ae:a9ec:9fc4 with SMTP id
 2adb3069b0e04-5aebdbc70a5mr1360054e87.63.1782853408064; Tue, 30 Jun 2026
 14:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260427051746.954704-1-rosenp@gmail.com> <ajRmlyx_AEGybykL@soda.int.kasm.eu>
 <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
 <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu> <DJCNDEE8JMPL.1DL49X1EUDFCE@gmail.com>
 <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
In-Reply-To: <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 30 Jun 2026 14:03:13 -0700
X-Gm-Features: AVVi8CdKSeWNxVJXoQWTYXgaetJpdvlliSZ-GmhRr-ByVwdKSQxkvdocgc7yH_E
Message-ID: <CAKxU2N9hw6bUNA+rZC_jfZVzi7bMXe96jzLWdL9F3P4=rYnmUQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Tobias Klausmann <klausman@schwarzvogel.de>, Klara Modin <klarasmodin@gmail.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140330_707074_B8E74952 
X-CRM114-Status: GOOD (  26.85  )
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

On Tue, Jun 30, 2026 at 5:18=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 6/19/26 03:50, Rosen Penev wrote:
> > On Thu Jun 18, 2026 at 4:51 PM PDT, Klara Modin wrote:
> >> On 2026-06-18 16:01:45 -0700, Rosen Penev wrote:
> >>> On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmai=
l.com> wrote:
> >>>> On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> >>>>> Check return value instead of is_valid_ether_addr. The latter is ha=
ndled
> >>>>> by the former.
> >>>>>
> >>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>>>> [...]
> >>>>>>>> Recently I have started to see randomized MAC-addresses on my
> x86 laptop
> >>>> with a MT7922 and the above message printed in the kernel log. I hav=
e
> >>>> CONFIG_OF turned on, but since this is an ACPI system the device is =
not
> >>>> described by any device tree and the earlier of_get_mac_address() li=
kely
> >>>> fails with -ENODEV. Looking at the !CONFIG_OF stub for
> >>>> of_get_mac_address it always returns -ENODEV, meaning this will alwa=
ys
> >>>> randomize the mac in that case too.
> >>
> >>> IIRC, the normal device_get_mac_address supports nvmem now. Does that
> >>> fix your use case?
> >>
> >> I tried this:
> >> [...]
> >> but I still get a random MAC.
> > Then the original patch should be reverted. Unfortunate that it doesn't
> > workq
>
> Happens, no worries, but seems nobody submitted such a revert yet since
> you posted that. Unless I'm missing something -- if so, please do not
> hesitate to tell me!
>
> But if no revert is in the works, could you please submit one, given
> that it was your change that cause the problem?
https://lore.kernel.org/linux-wireless/20260630210215.400379-1-rosenp@gmail=
.com/T/#u
>
> Side note: Tobias (now CCed) ran into the same problem, too:
> https://lore.kernel.org/all/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.lo=
cal/
>
> Makes me wonder if more people are affected by this and if we should try
> to mainline the revert rather sooner than later.
>
> Ciao, Thorsten
>
> >>>>
> >>>> Reverting this patch fixes the issue and the correct MAC address is
> >>>> used. I'm not sure if there is any case where of_get_mac_addres() co=
uld
> >>>> fail in a way that results in a valid MAC address but it seems unlik=
ely
> >>>> to me.
> >>>>
> >>>> Regards,
> >>>> Klara Modin
> >
> >
>

