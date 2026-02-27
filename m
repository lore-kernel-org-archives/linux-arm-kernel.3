Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD249FEFB5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=; b=0xqiH1KNmuWHrUEPmAKuD+maXe
	tGUuFXIzDPv1sSYdzQPoRmL7l2628gkD/tAMxN0yI4YW9hByOf8UHveJ1rC0AApLX+UaEtvzNDeKD
	CRfnAyBLvJFWPy6xEhxBgND3SjJw4pod2ra/pEhn6v9MaJfOXEuPVpmnkUoG8u8E88O1HcrYsY5IV
	g4HAf9J7FPrcx+UzmH/vsa4umjgOHi889DYGDRCI3kwLc/XFtAM9Qp03wodLN+8k39Z56iKD6KgN9
	XtChtavrXkJfHOs4FLMmduSfZ3mq3AQBIs9CWTO/OQx24w13qXScRqQTaLRPsxhgcwAnNWoARIIG2
	9InKs8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzkK-00000008cXj-1819;
	Fri, 27 Feb 2026 15:27:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzkI-00000008cWJ-0KMt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:27:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso2691635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206032; x=1772810832; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
        b=GrdJCmCV1yKRC2y5sMWNVOkDYxUDgoPIT8XqI/nWzkr9c/ihfewGsWBPJi5iGIXySP
         GEI/+ztgzr44eDYMq1KZdaJQ9SGeNcxkHRIjZHt3UVf51y6OiM8MEo1XU90iklZR8tsf
         w2KvG8mEzya2JkEvBUtrw5u91ozktMIekSiCE3VatGxLXTRiV7Q1PbQ0Jy2yYBY6sAB+
         mxLt5eByV9HYkEZQJ576QRTJY52CONmOqztTiaOJeryVasPoWQWeFMx9PA2AkmiZoz+L
         QN69EmilReIumL3VkCH1Tl0RCJfSl+fK91xxYBSmE9QPpf9V0X1KSrYXDuirtAECczWo
         wRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206032; x=1772810832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
        b=RbuVKG5yckDdEKjWqW1OrDcnxO/kfdjRJcMva7/YHRNyDf8XPGdOeYQfgXJ65y51VN
         pXgt2FIpu4CMNftr605/n2LjGgu1kIa24YMRyFOCrSRJ1PUHd13dKCMoy4P1g309JyQQ
         sjBxb09r726LRXNwp2UwuBm8WTc28bERdvpar6RWUqECNPCPgRDaAxYUjSmP74d7BJt+
         r7Cf8h5fQwIW6GwUAC/AzQACvTmMr0asOF7uMo5+8Vzi5FQNbvYZL1knMwHXCRQnNJ4t
         Iq1TH7msKw3B/YJIj+HLrezUM/pwJT5Lf+LspjLpMEW1ZxXrJwEIvSROWNqPiZQtMJqw
         VY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFdSwE6oA348gJNO8s1OPGbWwvPqQYDxlxK0pR/5fOw2zcvopKMWK3p0zmySKtRb2Z3JBXtMWPb5rBwJ8S95RD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrv3iXTse15MDdlQw3SuknASuFFCInVpSMoExfbpVIWzpKskYe
	o2HUkA0b8ZR4bMfE4cZ/14zIoJUtFs5+WHyFrDpmoPgxIj0ryKlHRnfE
X-Gm-Gg: ATEYQzx+mHcSl3P7F0854UXlnu2+Z+MmGIuOIkI/PkS22EHr9ymOR3/hYdIDhGZlw65
	EZXUo5sYrCi1lVZrt+CDiCp32vMFpRSyob/tfMnGR9IXU1+QO4pnTbDIymSpzBJYSCPd7jlxnfr
	QUqjZmKbegzf3Lqit2DcHIm629VouYKfus4GDSxlTTlxZoqZD7i0Yvec4vMW5NCv7VixgLABXq1
	MjHG7loAEsU6rJpgf9VeByuu+ZhLJ7EiorRbMsuEExvAsKDH2uA/PhQLkWe0jDN06bNFNLzY6zS
	sgR1V5kPIBIYSgm7b/+gObUC1PdUPr4G5m4Zln3dMasSDkSDoAcVquaTkFh5zfmehIbRGwZI8oh
	/nZPpGKdJ8S5LFzZIj2KS8BEPCrw04S+WlTkRT8qXExU7pLPRTQNwefxht8u/olKg2LC1Bcki2J
	vAEoiT/wad8eNxutVhSZlEfmRb
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-483c9c1bbdcmr27647755e9.3.1772206031724;
        Fri, 27 Feb 2026 07:27:11 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm360231605e9.0.2026.02.27.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:27:10 -0800 (PST)
Date: Fri, 27 Feb 2026 17:27:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <20260227152707.k5lobznug3xxxc7h@skbuf>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
 <aaGgWUpM2A5y11Wh@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaGgWUpM2A5y11Wh@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_072714_121403_18C47594 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Vinod,

On Fri, Feb 27, 2026 at 07:17:05PM +0530, Vinod Koul wrote:
> On 25-02-26, 09:02, Russell King (Oracle) wrote:
> > Note: only 8 patches in this series, not 9 as the subject line says,
> > as the set_clk_tx_rate() patch became part of the first series.
> > 
> > On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> > > This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> > > 
> > > This part of the series focuses on the generic PHY driver, but these
> > > changes have dependencies on the ethernet driver, hence why
> > > it will need to go via net-next. Furthermore, subsequent changes
> > > depend on these patches.
> 
> This lgtm, can we get signed tag so that we can pull this into phy tree
> as well

I think this series is obsolete. It has been superseded in the netdev
patchwork by:

[PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation
├─>[PATCH RESEND2 net-next 1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
├─>[PATCH RESEND2 net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
├─>[PATCH RESEND2 net-next 3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
├─>[PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
├─>[PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
├─>[PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
├─>[PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
└─>[PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()

(with which it is only partially overlapping)

I guess you should give your Acks there as well.

