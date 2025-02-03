Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cFXS6bLp3bdW8pWWRXjzU0D+975NvIlouYj3xU4beE=; b=2qVMIE/y3o/8AgGt/D+1Jnmicl
	uSLmuuHq4rEBt38PcwFgSOY6pHW9WpaWXFVcgOl6zy9KncETOpUcBHjJjTftBJflmLufTpkkfDfSf
	JqMcC48jd2ZyEyJKS9bAxjDMRRDfADHZvI6ULDOv/ct3aemS1lQWEL2PHDUvtGAKPsgd98yhLMqxM
	JRLT6QJFnBu3eB7J76CV8jJk7REqWJYf/xauhRHCnc+X65pEsS1b7jMyxKTpY1U/6Y4kwb5z1Cc2n
	MXt0tQsVYEgQe4nRUezIlMkrw3EjZrsatsn+NRvRFbwfhHJG04YyANP7+qL7DOFW/3JN9fqkVZsPm
	8/W2y0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teudC-0000000FEdj-0xV5;
	Mon, 03 Feb 2025 11:28:46 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teubr-0000000FEUY-2IOq;
	Mon, 03 Feb 2025 11:27:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D6111F392;
	Mon,  3 Feb 2025 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738582036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cFXS6bLp3bdW8pWWRXjzU0D+975NvIlouYj3xU4beE=;
	b=zgBDEV8ViUQP1HMNucyQnJcEpMz80RT11aQwq3O7TSc1wfvUSgKJKKNROduJBXY62ZZPp6
	c9Ni8vkmf5RE7COrZXBA8h9dRGGDLrDz0XcrLdbmSXYgq6WKLUpqRRtRdtOicEMCSkFPHj
	wQPKU3BtuY2NAiQrKQ2qJ5dVb02o3WU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738582036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cFXS6bLp3bdW8pWWRXjzU0D+975NvIlouYj3xU4beE=;
	b=I/v8nlv8rWRQaE8U//4dN7e4n0vX/OhaohvtUF+uWz4GKNAV9/ekrllLy+qzWnl8lI8o5+
	Mfat+fsRyff0TpAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="FO/uYKmC";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p859Qwti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738582032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cFXS6bLp3bdW8pWWRXjzU0D+975NvIlouYj3xU4beE=;
	b=FO/uYKmC9s14VlRRhtyaC8PVVH/fsUkX+ILo2sWmSKDOrpRD0DnfJmM5eet8946IVjtrgo
	jalJHToH9zddBqbFB1oETa7qrC+oXf9rRy+K592WvwqzXzC8ZYvJlxWR7Hp68iD35obr8J
	3/iOi/R4DtWIztkqxhiNsi0h8jRi1qE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738582032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cFXS6bLp3bdW8pWWRXjzU0D+975NvIlouYj3xU4beE=;
	b=p859QwtibXcAkzxGIt9330tkOdjfkkppdxFnNP89AlEe8wIkghTze5ua+JlwxfZvdMWG/M
	vo5PfW9/UIqdL3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AA9813A78;
	Mon,  3 Feb 2025 11:27:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F3mqEw+ooGfhBwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 03 Feb 2025 11:27:11 +0000
Message-ID: <426b6e9f-fad1-4456-b425-178877c4ab58@suse.de>
Date: Mon, 3 Feb 2025 13:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 07/11] PCI: brcmstb: Adjust PHY PLL setup to use
 a 54MHz input refclk
To: Jim Quinlan <jim2101024@gmail.com>, Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-8-svarbanov@suse.de>
 <CANCKTBt2J0c54jLO9C0coEExLUGtjCioj2SQTAuQkKctgLH79g@mail.gmail.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <CANCKTBt2J0c54jLO9C0coEExLUGtjCioj2SQTAuQkKctgLH79g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D6111F392
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,suse.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_032723_733098_76BD7B5D 
X-CRM114-Status: GOOD (  21.01  )
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

Hi Jim,

On 1/31/25 6:08 PM, Jim Quinlan wrote:
> On Mon, Jan 20, 2025 at 8:01 AM Stanimir Varbanov <svarbanov@suse.de> wrote:
>>
>> The default input reference clock for the PHY PLL is 100Mhz, except for
>> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
>>
>> To implement this adjustments introduce a new .post_setup op in
>> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
>>
>> The bcm2712 .post_setup callback implements the required MDIO writes that
>> switch the PLL refclk and also change PHY PM clock period.
>>
>> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
>> the expansion connector.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>> v4 -> v5:
>>  - Updated a comment (Jim).
>>
>>  drivers/pci/controller/pcie-brcmstb.c | 44 +++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
>> index 50607df34a66..03396a9d97be 100644
>> --- a/drivers/pci/controller/pcie-brcmstb.c
>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>> @@ -55,6 +55,10 @@
>>  #define PCIE_RC_DL_MDIO_WR_DATA                                0x1104
>>  #define PCIE_RC_DL_MDIO_RD_DATA                                0x1108
>>
>> +#define PCIE_RC_PL_PHY_CTL_15                          0x184c
>> +#define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK         0x400000
>> +#define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK      0xff
>> +
>>  #define PCIE_MISC_MISC_CTRL                            0x4008
>>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK    0x80
>>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK    0x400
>> @@ -251,6 +255,7 @@ struct pcie_cfg_data {
>>         u8 num_inbound_wins;
>>         int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>>         int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>> +       int (*post_setup)(struct brcm_pcie *pcie);
>>  };
>>
>>  struct subdev_regulators {
>> @@ -826,6 +831,38 @@ static int brcm_pcie_perst_set_generic(struct brcm_pcie *pcie, u32 val)
>>         return 0;
>>  }
>>
>> +static int brcm_pcie_post_setup_bcm2712(struct brcm_pcie *pcie)
>> +{
>> +       const u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030, 0x5030, 0x0007 };
>> +       const u8 regs[] = { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
>> +       int ret, i;
>> +       u32 tmp;
>> +
>> +       /* Allow a 54MHz (xosc) refclk source */
>> +       ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, SET_ADDR_OFFSET, 0x1600);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(regs); i++) {
>> +               ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, regs[i], data[i]);
>> +               if (ret < 0)
>> +                       return ret;
>> +       }
>> +
>> +       usleep_range(100, 200);
>> +
>> +       /*
>> +        * Set L1SS sub-state timers to avoid lengthy state transitions,
>> +        * PM clock period is 18.52ns (1/54MHz, round down).
>> +        */
>> +       tmp = readl(pcie->base + PCIE_RC_PL_PHY_CTL_15);
>> +       tmp &= ~PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK;
>> +       tmp |= 0x12;
>> +       writel(tmp, pcie->base + PCIE_RC_PL_PHY_CTL_15);
>> +
>> +       return 0;
>> +}
>> +
>>  static void add_inbound_win(struct inbound_win *b, u8 *count, u64 size,
>>                             u64 cpu_addr, u64 pci_offset)
>>  {
>> @@ -1189,6 +1226,12 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>>                 PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1_ENDIAN_MODE_BAR2_MASK);
>>         writel(tmp, base + PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1);
>>
>> +       if (pcie->cfg->post_setup) {
>> +               ret = pcie->cfg->post_setup(pcie);
>> +               if (ret < 0)
>> +                       return ret;
>> +       }
>> +
>>         return 0;
>>  }
>>
>> @@ -1715,6 +1758,7 @@ static const struct pcie_cfg_data bcm2712_cfg = {
>>         .soc_base       = BCM7712,
>>         .perst_set      = brcm_pcie_perst_set_7278,
>>         .bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
>> +       .post_setup     = brcm_pcie_post_setup_bcm2712,
>>         .quirks         = CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN,
>>         .num_inbound_wins = 10,
>>  };
>> --
>> 2.47.0
>>
> Hi Stan,
> Any reason you didn't make this a quirk like the other commit?

Not a special reason. I think that the code is more readable with
separate ops function which is executed after the generic .setup
function. The other SoC/variants could also benefit of such op.

> Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>

Thanks!

~Stan


