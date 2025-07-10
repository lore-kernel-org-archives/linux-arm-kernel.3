Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF67C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8s8aI5nykbObjyK4zFELHxY4NnJWT0iSTl57boBPsE=; b=mPnAZIYiS7+++vqP1UXTaYY2AN
	MZ4JPW5S6XpX9c3NevixU4GDuxWYpcGYiwZSKe3zLhoywdAH5MybpGU+A6z+msCzWzI4TjS0nOdBY
	S3MFsxfW04DCz8tMyTb9xa/mypnE5E6HQtDB/RbdhBUIdHkBjW2gf4QNPtzL1kSZaKCZlSJ4qQKFq
	uF8eK7H+egtShqQTFczqB3zn2G4CYJKmGwFRYT87WLkYCSto8bTlbL4+cw699BLx3x1cXuzNhsaFS
	IP/9bHRmfJqdKieb76juZCeqtQZb3rUHyz0/ICPb8O3IxypEPaUgfFExsoeEYbXUOn1K3+ofCAdJO
	4qyBX5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwU9-0000000ClCJ-0NHD;
	Thu, 10 Jul 2025 18:59:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtU0-0000000CIdC-02n0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:46:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2350b1b9129so9563315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752162407; x=1752767207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8s8aI5nykbObjyK4zFELHxY4NnJWT0iSTl57boBPsE=;
        b=PSdCFWNLJSnSrxQgpvAakEndi89RjE6kR6BUVMkp/DDNBQHJNIGexJTxLRjilzMsnO
         0+rgXEE5/Sy094kHD/qUkxUWd86nn1cyDzdcpiTVgAFt7c1mBeM60hy5P2WVhs/XlmjE
         aaWxsQzcWbXcssSFh/x19WwSt6AcxAs4tCPRdGwiOeQm0r+cOflbtaaCSdGnqnQDv/bl
         JoFKSR6kZ1vOnbW1OMHhbHo8bN4+8XbXMHHLJtI9vkJOVeaPAPFz03KcatR0U1gZACbu
         +tOid9DqYfq1qj7BFTMgs+MELJjcFY5bKAcn+Zsn9SFyInFc1Dd98kBWm3UTS5RnFobz
         dv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162407; x=1752767207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8s8aI5nykbObjyK4zFELHxY4NnJWT0iSTl57boBPsE=;
        b=sDg+c63SWlmjVaDobVnuUH6VR8XLAA8umxtqNaxeo6xOugzLSnnOklcBvvUdAvguzf
         HBx2i1gZdeKRSzp5CfTNgPMdGRV/4qpY6R5w4Rz4A63oZVbAAeTxLcgMD/OPo/93plLV
         ombpxtA06qnyUXM4ZrmKkScsOL9ACvyKcPY6OkEr119I6YrrC4P1Z2RY+8BT6mB3i2Y1
         gCoA8t32mJObF7fTPeL7tTXVSw7PK80IF0idqf0M10UbePC8my4bXYBm4Z6JZKMHU9XV
         R/kosEhLKbwPi/VaXll44Ez3Cspl/vfQt5K9F6/+1GRfk5mASmNk/gIKqO/FhBCp10mI
         QHHA==
X-Forwarded-Encrypted: i=1; AJvYcCUEnrBGfYAWJRgp3iSISYg5ub6Ukb4kG5OVZOga7VG3RULJpIMX5ad22P2akq5DxNNjO9CIH2spQmquVtDjUv5L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx09LUwr4knxIVP/nNxbgf+O7OEBxK7vbfykJcO6FMt+NEnXbdj
	hlW3d50cT1smkgONQzxPyj6OynHk7wfpNsdOsWdgATyMdcUIj6QNU58x
X-Gm-Gg: ASbGnctSte2xj5OHvLOhE58z/koajN73kPgoY88+Mt85660sSfDOM04BTpymmZkGhBM
	f6pZGTa1ddi8k7R4af+Mc/p8zaYbNonwZj66kv/NZu7ELpSoatvxCMGSTubuQqKqedG/0NrQGM6
	VVwO5ku5yxJZYJKesJA1kKhHMk9uqkHSMz/aYjDX+0moObvh7o/k1PCUU/gDsXDPwsnJmu8TaU7
	T3Rf/L/wIY664dSh8IdAW/xr90CAkQy+40MH/qd84Yk+WwZbTYa027lZkzeLv0xLvRNOHxxN98e
	k2mp5GlowN9DmADwWif8d/6Mv4m3XT5h9bkP5CMu1OAIgO+d50JBSsI+118=
X-Google-Smtp-Source: AGHT+IEqqSp2Bx4H9HZGWjwyRbPvR+vWlgwLlpuGUtnloA4G9XjlM92Y9Stck87gfHrX+jJIWpVO8w==
X-Received: by 2002:a17:902:ec88:b0:235:225d:30a2 with SMTP id d9443c01a7336-23de2512cecmr66021745ad.48.1752162406466;
        Thu, 10 Jul 2025 08:46:46 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm23794255ad.240.2025.07.10.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:46:45 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:46:39 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250710154639.hmbmzpaizhxqodqk@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
 <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
 <20250709082652.GA15057@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709082652.GA15057@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_084648_052881_0E9C9916 
X-CRM114-Status: GOOD (  53.66  )
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

On Wed, Jul 09, 2025 at 04:26:52PM +0800, Peng Fan wrote:
> On Tue, Jul 08, 2025 at 02:29:53PM -0300, Hiago De Franco wrote:
> >Hi Peng, Mathieu,
> >
> >On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
> >> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> >> > Hi Mathieu,
> >> > 
> >> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> >> > > Good morning,
> >> > > 
> >> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> >> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> >> > > > 
> >> > > > Merge the contiguous ITCM and DTCM regions into a single region to
> >> > > > prevent failures when loading ELF files with large sections:
> >> > > > 
> >> > > > remoteproc remoteproc0: powering up imx-rproc
> >> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> >> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> >> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> >> > > > remoteproc remoteproc0: Failed to load program segments: -22
> >> > > > remoteproc remoteproc0: Boot failed: -22
> >> > > > 
> >> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> >> > > > imx_rproc: Merge TCML/U").
> >> > > > 
> >> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> >> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > > > ---
> >> > > > Hi,
> >> > > > 
> >> > > > The ELF I tested had the following data section:
> >> > > > 
> >> > > > Memory region         Used Size  Region Size  %age Used
> >> > > >     m_interrupts:         680 B         1 KB     66.41%
> >> > > >           m_text:        6984 B       127 KB      5.37%
> >> > > >           m_data:      130224 B       128 KB     99.35%
> >> > > >          m_data2:          0 GB        16 MB      0.00%
> >> > > > [100%] Built target hello_world_cm7.elf
> >> > > > 
> >> > > > Which triggered the error. After this patch, remoteproc was able to boot
> >> > > > and work fine. Thanks!
> >> > > > ---
> >> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> >> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> >> > > > 
> >> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > > > index 74299af1d7f1..bbf089ef48ee 100644
> >> > > > --- a/drivers/remoteproc/imx_rproc.c
> >> > > > +++ b/drivers/remoteproc/imx_rproc.c
> >> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> >> > > >  
> >> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >> > > >  	/* dev addr , sys addr  , size	    , flags */
> >> > > > -	/* ITCM   */
> >> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >> > > > +	/* D/ITCM */
> >> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> >> > > >  	/* OCRAM_S */
> >> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >> > > >  	/* OCRAM */
> >> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >> > > >  	/* DDR (Code) - alias */
> >> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> >> > > > -	/* DTCM */
> >> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >> > > 
> >> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> >> > > this patch "dev addr" is not.  How will this work with new kernel that use old
> >> > > FW images?  Am I missing something?
> >> > 
> >> > No, you are correct, I think the use case I tested was not good enough.
> >> > 
> >> > If I understand correctly, this will break older firmware expecting
> >> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> >> > 
> >> 
> >> Correct.  Older firmware would still expect DTCM at 0x20000000.
> >> 
> >> 
> >> > Do you think it is possible (or reccomend) another approach to fix this
> >> > issue? In this case to keep using the TCM, instead of going to OCRAM or
> >> > DDR.
> >> >
> >> 
> >> To me the best way to proceed is understand why using the current mapping is a
> >> problem.  The changelog describes a failure condition when dealing with large
> >> sections but does not indicate _why_ that is happening.  I think that's what
> >> needs to be fixed rather than trying to move mappings around.
> >
> >Thanks for the information you both provided, sorry for the noise, so
> >please Mathieu ignore this patch. I will work around this in a different
> >way.
> >
> >By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
> >if the firmware is larger than 128KB, since the .data is placed right
> >after .text and loaded later to DDR. The imx_rproc driver should instead
> >have a way to do the other way around: starting from the firwmare inside
> >DDR, we could set PC and stack from M7 to point to DDR and start the
> >execution. Probably will be slower, but it would make the DDR case
> >possible.
> 
> I am not aware of the size limitation if image is built to run in DDR.
> It maybe MCUXpresso team just reuse the linker script for TCM and only
> update the link address.
> 
> You could update the linker script to build larger image.
> 
> In final elf, .data is put just after .text, but the related section
> loading address should be specified as my understanding. See below,
> .data is at 0x20000000 for M7.
> 
> xx-gcc -S imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.elf
> There are 20 section headers, starting at offset 0xc998:
> 
> Section Headers:
>   [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
>   [ 0]                   NULL            00000000 000000 000000 00      0   0  0
>   [ 1] .interrupts       PROGBITS        00000000 001000 000240 00   A  0   0  4
>   [ 2] .resource_table   PROGBITS        00000240 001240 000058 00   A  0   0  1
>   [ 3] .text             PROGBITS        000002a0 0012a0 0046b0 00  AX  0   0 16
>   [ 4] .ARM              ARM_EXIDX       00004950 005950 000008 00  AL  3   0  4
>   [ 5] .init_array       INIT_ARRAY      00004958 005958 000004 04  WA  0   0  4
>   [ 6] .fini_array       FINI_ARRAY      0000495c 00595c 000004 04  WA  0   0  4
>   [ 7] .data             PROGBITS        20000000 006000 00000c 00  WA  0   0  4
>   [ 8] .ncache.init      PROGBITS        80000000 00600c 000000 00   W  0   0  1
>   [ 9] .ncache           PROGBITS        80000000 00600c 000000 00   W  0   0  1
>   [10] .bss              NOBITS          2000000c 00600c 00a4ac 00  WA  0   0  4
>   [11] .heap             NOBITS          2000a4b8 00600c 000400 00  WA  0   0  1
>   [12] .stack            NOBITS          2000a8b8 00600c 000400 00  WA  0   0  1
>   [13] .ARM.attributes   ARM_ATTRIBUTES  00000000 00600c 000030 00      0   0  1
>   [14] .debug_line_str   PROGBITS        00000000 00603c 0002b1 01  MS  0   0  1
>   [15] .comment          PROGBITS        00000000 0062ed 000055 01  MS  0   0  1
>   [16] .debug_frame      PROGBITS        00000000 006344 000260 00      0   0  4
>   [17] .symtab           SYMTAB          00000000 0065a4 003cd0 10     18 586  4
>   [18] .strtab           STRTAB          00000000 00a274 002664 00      0   0  1
>   [19] .shstrtab         STRTAB          00000000 00c8d8 0000bd 00      0   0  1
> 
> >
> >Correct me if I am wrong, but as my current understanding the DDR linker
> >is broken without this change to the driver. Anyway, maybe something for
> >a future patch.
> 
> If you wanna image in DDR, you could specifiy the address of data section
> in your linker script.
> 
> But for support ddr elf file, you need patches as below:
> https://lore.kernel.org/linux-arm-kernel/CAEnQRZC5t=qmo+OJLW+dqZg4gH9cAN=paWDSGbrJb2AvkKBqxg@mail.gmail.com/T/#ec54c42b70416b002936a643b44b79661dd2a8483
> This patchset was rejected, because we need to get stack/pc from .interrupts
> section and store to ITCM.
> 
> Latest NXP m7 demo has included a new section for stack/pc, but
> this will only be public in 2025 Q3 release, for pre-2025-Q3 releases,
> still need the upper patchset.

Great, thanks for all the information Peng. I will inform my team here.

Best regards,
Hiago.

> 
> Regards,
> Peng
> 
> >
> >Thanks,
> >Hiago.
> >
> >>  
> >> > Thanks,
> >> > Hiago.
> >> > 
> >> > > 
> >> > > Thanks,
> >> > > Mathieu
> >> > > 
> >> > > >  	/* OCRAM_S - alias */
> >> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >> > > >  	/* OCRAM */
> >> > > > -- 
> >> > > > 2.39.5
> >> > > > 

