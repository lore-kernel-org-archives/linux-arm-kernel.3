Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2874CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=; b=w/1y+qsFS+oMy4AlNZQAwYsFEB
	0iEq4Pl6EgCjVe9wMT8UTGja3n2L7e2sbNm7H11j2s9/VGwtL+iEWBYPSZQLU/i4aqrnZS0uowG0s
	yhzWvefDjraABM0v+9tuFhayLH9e6aVokiD2w5UUEIP4V9K7pJ9SeyQXu4Kfpon6kd1CxSkfzau1s
	40mJhRE8ipDQfMKTavSHf4KbKSypmaI+FwbqhTIO8FLdo2F76+S/g0Nvd8Q883ymPtd2TO/nr9YOq
	Xp+OnlQNfvElQuE1zzdjgfRmwoS7xuU8/aFFp6pd4foSmmXzE1Ok68DjplJDnvK0sLd9IouentOwu
	uJVrDR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPRC-0000000D8Gt-0mhU;
	Tue, 02 Jun 2026 13:45:46 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPR8-0000000D8GT-3G5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:45:45 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7e053987001so25857827b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 06:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407941; cv=none;
        d=google.com; s=arc-20240605;
        b=bgICT252H00G+wZmGPwZPqlN+lgxC9t5Uq/IvA5eRtG38aXPWFyFmYeSpUl4K8pyQh
         zfBrhHoEWizTG+Sx/KgarRRB2f07VOsGpkxMAwCJYVoCnsZ0USTIH94DZfkgQK7lgAr9
         Z+BkQtPcZtXT47owZ7rPZaNP9dZ5zLVti1ltZbTjIMZqfhKgrLgiZodXTvBP1DBKcXSh
         SgiJVWmyNAxcQd3IE/ZmeuEuu/tgqoaFV7qi4SUeFkys/fLqdopJjlvWxnbNZsPBHhBK
         At0iA3kuOBudhsMl/nnF+946e3V6msj045OSfpC/sdAF9u7R/xvHChVOlCjDluPFtSR+
         O2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        fh=g7gmdm7ktZ0QXbcVczpjMiufy2Cffhg5B9uJ6yxIClw=;
        b=h5KxbuLQBw0I3Je8llAKbqnWjagdFmYRsJRijNelhciG+NIAzqwvo3FLZeqta3CqKE
         zpfzbwVl+FSTbkNpI/cKWY0ZAEx4yEO6TjwOSJIQ3Eh7LXuyuFmNgkCRrTJIJQ6ruKWq
         ctN4JQ7X2GqkItB5yIRloRpJDSISEGpHRij2Z9rk+ycB5jfhNYf7IOfH0Yf0PrW24dX0
         l+hU6g81x1iDOxANKAGn1jft67+MN2VpbhIgWs6vVxV2YBY/Dh5gWBvomyIq1dTA2qxN
         SgJ1vDDFuzmWEpKViotYWvnxV0jz/KiWsGDppujvJc2r75FA9IsquYqHf9vJHeqn7n4V
         0fvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780407941; x=1781012741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        b=zrlEFCJ+VgLVbrodC7qWE3tund9bhLLxpmeoimDUP6SYqo4B2v/ER51broJiCoqP1V
         84WYVhvWG0iiuPwvLTssBwP47C12C74efa2C7TChvNCIF7Uya2Bcm35/Y/bXxX2Qg689
         bg0wnBI+OKgSJ7zVGHKX47xzeCmHSb8yR520eEbJUBnEZ1gBhVQm9hyjGNEQ06fbps0b
         R2L5rm6wNQrP+kOZxzT6KBK98q3Pmi1CW8UFjVAL8M0KyeqpG2IAzKR6w9HyeVnREUPR
         gOcoYsUEmlPB8qtdjzX6pwJjiH6ZETYTj78BrwIxxGTa/tOZl0WKm+UsMN7A7yhAzLhl
         ldQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407941; x=1781012741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        b=PmgcRbyutnthzVsnkz8jmI1/Mi+fp50hDAasavydqlMuONP77eBoo7NCxoRrA8Q1ZD
         ip4BSzCmtkByrjTyFZ5+8zTYcF+GKnQs6hytwIf+PCRBDei+r43lLYPGh9QBrUsA034q
         Ggv9rxzxR9TnLiB44ln52CuTgAygcMF10w3lVLkPqLSOApqnRqBUd4T3oWAlmlJTeJtt
         NWvEoPDImMeeVRCGT3sINbyKJ95fuwJ1El3VDfST+qz9zA2+LIUe9yIwEBh/5JeSYfQv
         mEEQocX4LIl7hXydLEU2bfCiGEsf3AczreLMwF8pqj5W2OJqIeCTJC5+nZADFcKhk9FD
         18mg==
X-Forwarded-Encrypted: i=1; AFNElJ8QTkrwy4b/VVJYyzinPfwOR/uapT5i5cYc60JYnd4e6rQwxNvWjFpvmDkwtCs59I4cTS41lkpajjc+nPkMI2V2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1+gotFQRym51CB8OLtL18ySPlp4iEK0gHzlEr0jkGDoumqbcX
	ggHXjEf+o/l0QnIWESEeMNgsb84IUrnIXGF04o7sc+Un3a6h78lEdPVqWurEtRp2SYOW3ufEIUb
	SmAX5iCaMk254SUH2457s97V6/HdRYD89/3fhPZe8uY80Yge+JiavRGO/
X-Gm-Gg: Acq92OGkzDdn8GjHlML/OLbg3HDe+WEyhN9qhc0OBhnDrZ6idlVtmL+xpOMAUF57dak
	Un7QuIC/bAoVSMAEqIMTo6rHQuQ7HAEOTw2uZ9CFqt4oTx0fZpKiXJm9XIbs2Km6+OhvSdTOxO+
	1o0rTm4uk0kehAaySm9DMqmriZ7NySwOSe+cz/P4niHvg8YCW/kMZrfoiYMdoiwMBTTcctx8Yw/
	HEwicIrd6sABIqoO80/3BGiVeo1y+7ddvJ42hMDoe7VcWrrLSN5wp5AGQjKFIciCalg+ehMEBvI
	a6Bw5fx/sJNjkS/r/MZXo0gDDXuzI/73u9W8SkyFgA+idQRa8CSJNJHuO6RoUQ==
X-Received: by 2002:a05:690e:408c:b0:65c:290a:d7ac with SMTP id
 956f58d0204a3-660a60f477bmr2995698d50.6.1780407940794; Tue, 02 Jun 2026
 06:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
 <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com> <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
 <55c1b29a-cdea-4508-b77f-d5a2da247662@app.fastmail.com>
In-Reply-To: <55c1b29a-cdea-4508-b77f-d5a2da247662@app.fastmail.com>
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 15:45:31 +0200
X-Gm-Features: AVHnY4IJdLvmxR6QW8fYJcxGv1ygcnwa_HYL_gCiFtUQ8w0cJZRCGJCbylQkZy0
Message-ID: <CAHTX3dLhDT0TVD1+=MVzjNPAY6yi9Yba6WfZO1ihq+k_82n7Wg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_064543_000899_886DED1B 
X-CRM114-Status: GOOD (  36.24  )
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

=C3=BAt 2. 6. 2026 v 15:00 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> na=
psal:
>
> On Tue, Jun 2, 2026, at 14:29, Michal Simek wrote:
> > po 1. 6. 2026 v 22:39 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> nap=
sal:
> >>
> >> What type of userspace would access those, and why can't
> >> this be done in a portable way?
> >
> > multiboot is useful for A/B updates when used. It is also pointing to
> > where the boot image exactly is.
>
> That sounds like it should use a reboot-mode driver. There is
> a patchset that streamlines the reboot parameter passing that
> will hopefully get merged soon, see:

not really. When you ask for a reboot you could reuse this mechanism
to boot to a different
image but in A/B which would be a very hard way to do it. We do use
ARM DEN0118 spec
with mdata for it. It means actual change in multiboot is done by low
level firmware where
different values are read based on mdata structure.

> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboot=
s-v22-0-28a5bde07483@oss.qualcomm.com/
>
> If you can't fit this into PSCI reboot arguments, you can
> add a custom driver here that picks the A/B update etc

A/B in our way will be handled via capsule update/u-boot via ESP partition.

Maybe it was misleading to point to A/B. Even when you have a single image
it is useful to know which offset was used for boot. Because you can
have fallback images
if the first one is broken/corrupted.
I was more thinking that maybe useful would be to share it via nvmem
like it is done for some other options
drivers/nvmem/zynqmp_nvmem.c.

> > idcode/pcap for fpga programming case. That your bitstream matches the =
device
> > you use.
> > Scripts or user programs can use them.
>
> You already have an fpga driver, right? Why is that not part of
> its user interface?

The fpga driver is just loading the boot image and providing a way to
firmware to do it.
There are different types of bitstreams/formats. Bitstream in bit
format has header which you can validate,
bitstream in bin format don't have this header. Then you have also
encrypted bitstreamed, compressed one, etc.

When you have support for more silicons (different PL sizes) you
should know which bitstreams need to be loaded,
passed to be programmed.

Maybe at the end of a day instead of creating a custom driver with a
custom sysfs interface we can create a nvmem driver
which can dynamically create cells based on firmware interface.

>
> > IDcode could be the part of SMCCC_ARCH_SOC_ID but we can't change what
> > we have done in the past
> > but we plan to implement plat_get_soc_name() which will also contain
> > IDcode. That's the one where a standard interface could be used.
>
> I'm not sure what plat_get_soc_name() does, I don't see that in
> the current sources, but can have multiple soc_device drivers
> and use soc_device_match() in drivers to compare the ID
> string from the platform with a known lists for things like
> driver quirks.

Sorry that's function name from TF-A
In Linux kernel you have smccc_soc_name_init()

in our case version/revisions are defined (and to be fair to say our
firmware messes up with version/revision)
but SOC_NAME is unused today for us and that can be used for passing more
information about system/chip.

> If there is a hardware interface to find out the ID, just add
> a driver that registers another soc_device in addition to the
> SMCCC one, and soc_device_match() will attempt to match each
> one separately.

yep.

Thanks,
Michal

--
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

