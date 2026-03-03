Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45504EDA68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=; b=QSUmhYzE4Fx1ctw4f9D9UH/ujW
	HQY3nVgYj6ZR5xRoICaCCyLVpvbnPWse4FHfIQxmRy0iuz2Wsd86KAHd2h0OFb3Nds+7ZFR/2EbSg
	MdCVF2ZVhUquRs5piWS4XsQoo3K8+Czbt7eLCzmxWWH2j3i54UJ/eJ/ZoSgnY6Bkcxy1qf8Enx9If
	hjuy/18Kmbg2QovuiQHAO8iqaXT04rLK2QBRulcSThaFNLr5s4SJpufMwgmirbkQeepfIQ0Ww2Zqb
	8Ssl+PLOOsG+W+sjoMUur9N5SHXNVWM9OSwubxmfpDoA9bWnIHUsm2ONe38FFVIlyyY5/VgdcLlHL
	oPkQg2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxShf-0000000FaBB-3bql;
	Tue, 03 Mar 2026 16:34:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxShe-0000000FaAm-2KEB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=; b=p4P4Wd7QIHjM4foHcknjdtcv66
	XcAwHlWvjWoFqAdR3mLglF8iUXV2Kt2x63Ef105WvHcShyoGL0SQGzOYcgo8kgWYhj91bCBMn1bn2
	VzF7MmcVNWDkjTpcFjHs0nQGxpPoDObSgWzg/lLnmzgMhaJPt+R272luygLIB4L1ozmwB3Tf8jDkE
	rj9+jjcwg3KJ3cmi/3flxysIohCh8zpYeY4A8E/k2DRbFK8g9vDCXC+qciyMiNgyUOoZjriXiP2vO
	QFIlIUm6eZ0SylVatghBwwOhXNGrutpxvlYamDPDzwYlm6ozNGY2vPDIwxiJVCFZDNtsDVnJwR2Kt
	37npdmXg==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxShZ-00000002ueZ-30Se
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:34:33 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d596ab0917so3592680a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 08:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772555667; cv=none;
        d=google.com; s=arc-20240605;
        b=EhnD9PW0EVctKT1AJUiV1xPwbMCtPxGZwJCySUipXanwUpOxpWIDNuJPyxXdoF25za
         M6e9QeAXEP/Fcqwm6zXQxZyeOSuoou1qzYDvND6qhLXjlWSf7buIlYSA6bKHMkTwnBT0
         mXHqgHT47yblTmcaKVBglmHgc/9LGy2SEc4Mafef5+MIqWHmuDU8BQkHpTO8GN63x/9J
         hONrqBW9Uc8tHrjEavFNwb3fYaZQbU33e8bYbekK1bIM7TKnyqB1+sgI2qeB6wh46MS2
         4P8+807KFsmYGCqZ9Ikrp82nmBQcnu2adNKC6PR/ujUAE95dy3EPq29Yl4P8ffLIVd/o
         R8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        fh=bQj0syIerxpI5Dd6gNYkQk1s4VIE1KOnJUSAe4FOBzo=;
        b=arblDeOpcjtBFCp6H+OJVVirBF28JkvfH5e6QaeofovkRbnJjuGWYAZX06aad5Q4Lm
         iqHAtajy/PSjpKV3DJYY1PjmKQTvTnuqD3WBIX1gp/iiERYs8U9eqfDe3VDVWYOhDPcI
         0q2yZM1gJosBK8w8D81GAoIe/cbA0Us5Hz1hBqC1fkw857nG3Kc3lFH13NAIL7SOCmFl
         t4K4ty7U5Cp/uDZ+hyMaHMyBc159FV6SAjRP6eGpi1qRQjTur9TNU+NjZvM3wAKgSO6n
         ZSTW69susmxlr/nMMocY+LRgHSo7myzVU5ez2rrVFdox36fkUaAVMmWu837KeHS8F81P
         Exwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1772555667; x=1773160467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        b=KkbhAa21kbqAf+BRI8rwoG7ZIzSmig5jMfZQ8u13FKjFb9ZpPXr9/izJpEaQHzpRgn
         E73URw+goqf1/MjUDHPWr4qMaWJ0Z9sWVhPx86lmYljBasG1sLZlBJ3ZzstPHWlg8TYV
         Wgj6gJaB4pklaaKOtfUDv/gic1QCHpUQ/En9RX9H6SAXLgNg5rfGSgqYQNYMuazB59Et
         7x/7SKwH2S0mJC+aW/RBOEExO1WcYtuqnMfHEr7CWc/zgxdVPYqqScl6fTUUPxEgBGNi
         KJmLvRCq5KNzM6cuSey/cavtBG4FfLLOqgBMcmemoRqmG2X+q80vGCRx2Q1Semp7KocP
         FXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772555667; x=1773160467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        b=m4p33Kk5InBSDkwOECH4RX0q3XKKXkI360KhIJCly1kCBIy3pJntKzC5rO1cwNqDdQ
         xEjs93I2ZVDBE9LoWMX9jxFI1NiwgrBRb8XpHexcWChyQ9M8AxvVV6vWZsl4FtIu6U09
         m6/6Hxgz+O0VOV9CtZf1SKkefTu2PFfXgMO32S3ByG++sAVqQsx/I1QbwW1L19XIiJzR
         3y8grBSF6rXNpqs8iALdulHq+0r+tJP29vWeEgmETMFWD7OdqKnwgVfFyXP8WdnFnOcg
         01Q/2A1G+1EqKHcGv1hXQeBqtbZ4vqWy9dkvZ3Da9hCW5MNEdPLMrLzdtmTUklMe8QEN
         o4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzqwNBSWk15eRR0GbohQ2YJaby9z5Qnj4n34swzvj1axOi1iikwivZpgcOtJ1CLuaqnnC+JWwaz9wzaCPV8lTH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Nf7ZZpmkbQeA18tKL3Fwv6T2hvP76Q+Kw9899SLPOg1eKJ71
	qbtjXM6SBR9tT8AtFo8qAlUU+2bvSrcE5iB0Yq+e0OvKAo6j34KxX1PfpGKWrNsN6f1WcrjiByr
	ZEmli97N1bdLYalxjvB/38gDO+OpHfjyoDuVXmkGILQ==
X-Gm-Gg: ATEYQzzW+Jcp1jjwynhp72nutklMpivseb0WVgKyOS/wj2AUJ+AuOXRCzfgBVjUScs0
	JNV1p89rEoDdatkN3l+aZqLxhmDrLA441JwwD4CCQ41jQR5KEQ4dZZQEoWWaEd6auZ9RZd5FDK3
	AAZjczdRPP15xH6h2m4UpZcROcr6BocjCBbekALW1Ab24HthTfMbX4/w6MXqLNGh67+X5Ixd1/K
	Ge/qjdMf61LX4NHYFx9Zpn85q2GHk4EhPcpAGh35GhBoh9mtH15qSPy7MbWZrMBREOCTe6/B2s0
	wi9sMkA=
X-Received: by 2002:a05:6830:6e54:b0:7d4:8c9d:dd2b with SMTP id
 46e09a7af769-7d5be1fc888mr1174689a34.0.1772555666720; Tue, 03 Mar 2026
 08:34:26 -0800 (PST)
MIME-Version: 1.0
References: <23024521.EfDdHjke4D@steina-w>
In-Reply-To: <23024521.EfDdHjke4D@steina-w>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 3 Mar 2026 08:34:14 -0800
X-Gm-Features: AaiRm50Px49HlJBebz525BmL7mRczLSo_5VnSZhLsGQrektayrJby8PDCB-XxsA
Message-ID: <CAJ+vNU1m6Uw8GrXO5+o6UGRUwcXrVJJ0BSUF4rrqLN+RsL6Mrw@mail.gmail.com>
Subject: Re: i.MX8M Plus PCIe link regression
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Richard Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163430_120238_5831C24D 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Mar 3, 2026 at 4:38=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> these days I noticed that there is a PCIe link regression on my i.MX8MP
> platform (TQMa8MPxL) running next-20260227.
> I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip link up
> workaround for newer platforms"). I always get the following errors:
>
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error =
-110
>
> Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2 device=
 is
> detected without issues.
>
> Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
> b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both Gen 1 =
and
> Gen 2 devices are detect. Commit 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc=
 is only
> required for conflict free revert.
>
> Here is a summary with outputs:
> Gen 1 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 01)
>
> Gen 2 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe SA=
TA 6
> > Gb/s RAID controller (rev 20)
>
> output of "dmesg | grep imx6q-pcie". Common part for all tests:
> > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > 0x0000000000
> > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > 0x0018000000
> > imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 =3D=3D cpu 0x1ff0000=
0
> > imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K, limit =
16G
>
> next-20260227
> Gen 1
> > imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_STA=
RT
> > imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with erro=
r -110
>
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> next-20260227 + reverts
> Gen 1
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> What can we do here? I'm wondering why Gen 2 trains correctly, while Gen =
1
> doesn't.
>
> Best regards,
> Alexander

Hi Alexander,

Does your link partner perhaps suffer from some errata?

Ironically I have had PCI link issues that required the patch you are
needing to revert on IMX8MP with specific switches.

Best Regards,

Tim

