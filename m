Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB5DCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svHe049nif8miK4UiQLof62m/NP+mspBHCm2T/LeDdY=; b=VNNQ+WqS5ck1j4R194lkAd4rHs
	Nu1JE1B1CP1o5kJN04/4Vpb9DRDWNURZ7gz2ul6xfpGQwXpfkO3YUR18Y5DhDdTxGX1RUdGkltLr6
	5FyxWExypHOYSRAZ+zteviSOtu1qu5InrGsMmU/a9RO/ua7Wh6HgaM0sbREmpT4+CXnwkrQQqLc0d
	3nCNJVO+gKs1uefJ/kVYCDvPVzJSKKZUDMWf4sKYftO07eaw0IZ79drAhq55+0/aHEDk6DNwLvgbW
	6MMJClgnl6hk5TUOYbVOYCiovPyJgh3QtGuq3m2zBFagX5Aor1JfTFQgqcP3w9BakMfJWdE7ejjyM
	qMGsxBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtCO-000000061H6-2kJV;
	Thu, 23 Oct 2025 11:09:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtCM-000000061GO-1uMc;
	Thu, 23 Oct 2025 11:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761217775;
	bh=whx3qauetCaL8L4L/j6vIJhu8Al6aBGqgPVGr7Y+0y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYxOP7Y98ENygjBbGy1cxfywA2ToT7ntiDye2btmfJLFQ9t4f0bh3I+180vRpleYa
	 mBzJRPPPkvd2nnt4SUBL9NSGmlE6hFBiXCEiz1AhStX9y0HFYIiI1YVYoZlu7zxnlR
	 mCXHkxr6maqOiBMlzVGCtQuL18faF0Jd5RSfUdngZTzoBgpc4ghtu7QUhz3xTwtj7j
	 /EEMaHYVzs4gyMvly/5/ae+Y/I08BVIPvtLaZo+xvCnkfqVhWdiGzDcDu67wWIAIXL
	 UXRW4Nyt8UdJFTX2KXOeF5ljn/DHtt1AU+n/EPNMiDMofwzYmnzrbLGpl7VbPZDsVs
	 mrRwaQ4PyG5Sw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:6ab:9c26:3ff9:9bf9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7498817E00B0;
	Thu, 23 Oct 2025 13:09:34 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: frank-w@public-files.de
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	daniel@makrotopia.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org,
	wenst@chromium.org
Subject: Re: issue with [PATCH v6 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
Date: Thu, 23 Oct 2025 13:09:22 +0200
Message-Id: <20251023110922.186619-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <trinity-00d61a0e-40f3-449d-814a-eccd621b4665-1760291406778@trinity-msg-rest-gmx-gmx-live-ddd79cd8f-fsr29>
References: <trinity-00d61a0e-40f3-449d-814a-eccd621b4665-1760291406778@trinity-msg-rest-gmx-gmx-live-ddd79cd8f-fsr29>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_040938_828127_420F54B2 
X-CRM114-Status: GOOD (  25.11  )
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

Hi Frank,

On 10/12/25 19:50, Frank Wunderlich wrote:
> Hi,
>
> this patch seems to break at least the mt7987 device i'm currently working on with torvalds/master + a bunch of some patches for mt7987 support.
>
> if i revert these 2 commits my board works again:
>
> Revert "clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct" => 8ceff24a754a
> Revert "clk: mediatek: clk-gate: Add ops for gates with HW voter"
>
> if i reapply the first one (i had to revert the second before), it is broken again.
>
> I have seen no changes to other clock drivers in mtk-folder. Mt7987 clk driver is not upstream yet, maybe you can help us changing this driver to work again.
>
> this is "my" commit adding the mt7987 clock driver...
>
> https://github.com/frank-w/BPI-Router-Linux/commit/7480615e752dee7ea9e60dfaf31f39580b4bf191
>
> start of trace (had it sometimes with mmc or spi and a bit different with 2p5g phy, but this is maybe different issue):
>
> [    5.593308] Unable to handle kernel paging request at virtual address ffffffc081371f88
> [    5.593322] Mem abort info:
> [    5.593324]   ESR = 0x0000000096000007
> [    5.593326]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    5.593329]   SET = 0, FnV = 0
> [    5.593331]   EA = 0, S1PTW = 0
> [    5.593333]   FSC = 0x07: level 3 translation fault
> [    5.593336] Data abort info:
> [    5.593337]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [    5.593340]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    5.593343]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    5.593345] swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000045294000
> [    5.593349] [ffffffc081371f88] pgd=1000000045a7f003, p4d=1000000045a7f003, pud=1000000045a7f003, pmd=1000000045a82003, pte=0000000000000000
> [    5.593364] Internal error: Oops: 0000000096000007 [#1]  SMP
> [    5.593369] Modules linked in:
> [    5.593375] CPU: 0 UID: 0 PID: 1570 Comm: udevd Not tainted 6.17.0-bpi-r4 #7 NONE 
> [    5.593381] Hardware name: Bananapi BPI-R4-LITE (DT)
> [    5.593385] pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    5.593390] pc : mtk_cg_enable+0x14/0x38
> [    5.593404] lr : clk_core_enable+0x70/0x16c
> [    5.593411] sp : ffffffc085853090
> [    5.593413] x29: ffffffc085853090 x28: 0000000000000000 x27: ffffffc0800b82c4
> [    5.593420] x26: ffffffc085853754 x25: 0000000000000004 x24: ffffff80001828f4
> [    5.593426] x23: 0000000000000000 x22: ffffff80030620c0 x21: ffffff8007819580
> [    5.593432] x20: 0000000000000000 x19: ffffff8000feee00 x18: 0000003e39f23000
> [    5.593438] x17: ffffffffffffffff x16: 0000000000020000 x15: ffffff8002f590a0
> [    5.593444] x14: ffffff800346e000 x13: 0000000000000000 x12: 0000000000000000
> [    5.593450] x11: 0000000000000001 x10: 0000000000000000 x9 : 0000000000000000
> [    5.593455] x8 : ffffffc085853528 x7 : 0000000000000000 x6 : 0000000000002c01
> [    5.593461] x5 : ffffffc080858794 x4 : 0000000000000014 x3 : 0000000000000001
> [    5.593467] x2 : 0000000000000000 x1 : ffffffc081371f70 x0 : ffffff8001028c00
> [    5.593473] Call trace:
> [    5.593476]  mtk_cg_enable+0x14/0x38 (P)
> [    5.593484]  clk_core_enable+0x70/0x16c
> [    5.593490]  clk_enable+0x28/0x54
> [    5.593496]  mtk_spi_runtime_resume+0x84/0x174
> [    5.593506]  pm_generic_runtime_resume+0x2c/0x44
> [    5.593513]  __rpm_callback+0x40/0x228
> [    5.593521]  rpm_callback+0x38/0x80
> [    5.593527]  rpm_resume+0x590/0x774
> [    5.593533]  __pm_runtime_resume+0x5c/0xcc
> [    5.593539]  spi_mem_access_start.isra.0+0x38/0xdc
> [    5.593545]  spi_mem_exec_op+0x40c/0x4e0
>
> it is not clear for me, how to debug further as i have different clock drivers (but i guess either the infracfg is the right).
> maybe the critical-flag is not passed?
>
> regards Frank
>

Could you try adding some debug prints to help identify the specific 
gate/gates causing the issue? It would be very helpful in narrowing 
down the problem.

A couple notes - I noticed that some mux-gate clocks have -1 assigned to 
the _gate, _upd_ofs, and _upd unsigned int fields. Not sure this is 
directly related to the crash above, but it’s something that should 
be addressed regardless:

MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
		     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014,
		     0, 1, -1, -1, -1),

I think __initconst should also be removed from clocks that are used at 
runtime. I’m not certain this is directly related to the issue, but I
wanted to mention it in case it’s helpful.

Best,

Laura

>
>> Gesendet: Sonntag, 21. September 2025 um 18:53
>> Von: "Stephen Boyd" <sboyd@kernel.org>
>> An: "Laura Nao" <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
>> CC: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, "Laura Nao" <laura.nao@collabora.com>
>> Betreff: Re: [PATCH v6 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
>>
>> Quoting Laura Nao (2025-09-15 08:19:26)
>>> MT8196 uses a HW voter for gate enable/disable control, with
>>> set/clr/sta registers located in a separate regmap. Refactor
>>> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
>>> it in struct mtk_clk_gate. This allows reuse of the static gate data
>>> (including HW voter register offsets) without adding extra function
>>> arguments, and removes redundant duplication in the runtime data struct.
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>>> ---
>>
>> Applied to clk-next
>


