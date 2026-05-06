Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FBCCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SbqEMIRZJlHc6JKkwETPU4424MlqTlraWGTdcFOX+ew=; b=LTtZE7hjXu1NkgYeh0q4Td9mZK
	6vfbuorfO/5OkOrQjapJDiitkl0bbcujXVnAv8gke2TFuzs3Azut2wBAhNfR0MCzW19bee9dPGPo4
	F9WxFbP9u46SeAeze6ffKnyqPR98zwrRgFs3EuAh+HIftRwNF6/rImMPhMN45lQOpDmEaNqbPRavA
	MX++g39iQdLWoQ62uZsRKIdCa4EG0DdMF8J7ea5kRzZKgdSsj9OCHqnBm1q/zIHl/tRPPODwnbYjy
	aGKEdA3C3W02KuBt23uy8nsxhIVEWStIUjCwhZShZTavI3xsY7StG7Hb9cufeMk2Xry0YWAy+j+Df
	bsStpwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXtf-00000000DAU-3kpo;
	Wed, 06 May 2026 08:46:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXte-00000000D9z-2LVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:46:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b9ea536877so5056075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778057181; x=1778661981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbqEMIRZJlHc6JKkwETPU4424MlqTlraWGTdcFOX+ew=;
        b=jPkuluBfLSOA6qb1IBSrLEmOR4y1HdqrheLxfkTl4fvXo5C7ePrOZ7NrUN2CluIS6x
         Iii5HAEkIUJAh94qdodaikzkM7mJvaW0L0TxTPU6g7LURySnYpH2WmPfGpka/3S9V9AI
         mBuKJ7XNQNveIoYRhs2WWAQm1YHt4I2KYhZWcDOJxKE8Vy4LbNtl1NV0WOo1nHKL0m3C
         YBmS5tnkDvh57ylbWPjgrWcZCXOSVm17ljoRN4QbLtfamQecMS6ASTCsv9xxDcK6vX6y
         22Dfp+1WY4E5TZocgAR0s3ENxUawyMU+ov8lLFV4ebABPmNFcgR7Phyj0Ebo443c/jbg
         XrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057181; x=1778661981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbqEMIRZJlHc6JKkwETPU4424MlqTlraWGTdcFOX+ew=;
        b=CIOZ+SMzxjMTVmHa8z+mXOfeWr6Dml+o3gmEpTMoCF+hx2cgZU6O4+/GNQmk4uWlL4
         PR/kozpbK4KCEer+/8/WJFkwCW+aPjzQdjUrT2zbjO5JdG+2/WrD1Y1BQo1aF4+9dHfr
         QgaVfXIgu3H5ygmALfgApWUaQ3sw1YGFTnCLKdsRsJc5At0JeAGyuaHYdNRK9MGkjbug
         3s0s5rGI8bpjIGCIu7/BGoWBMaqoJz76YY21bi7/cYNYIV0oCtBj7MYRc17HXfZMPj92
         b/XzCZ8rKnX7eIxilKnv2jcuhu4pDmfC8kpYlxJOszfW4er6SafePZlCNHBK5k944jn1
         OzwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eeBseKQ+JT9rNwu7nPBLHNsoE7ZOk+ohjFhovmOMZ5j7kDniwKF1BfX5BXOAD74YvFnae+IR+vguoxb4X2beu@lists.infradead.org
X-Gm-Message-State: AOJu0YxxMe01B7J1rJFgghsLM78Bjhgu6xsGfivjYNFne1NzM6CSW5GI
	msqOoL7H05iQLXPz1yI0J/AM3+8ICNJstGJMJTGKuK9BH+veTL00xs1H
X-Gm-Gg: AeBDietTQNFS6fmcRiIoKzkoJoRokhQXY4ACjQZOukwP0rQmAx6CCKl2uHb9f04viNo
	4ENXTQI9jabFz66yV4NV5SoPs0pZItyEGq0t5mpAd3NChk+aHNIRzvAt3PFvm48ZXmkdagT+bhu
	ppp9o1h/WRCQdQOgLD+aUixQ9+SDR0bFm1BQ/cuc3obQCw7Iwllv/bXi6u0zh9mOr26eqADgxDm
	PmaiMFW4vUiyULsBiZ4LERLwHX3wQPo8BACrjWNiqrZRBzAeDRTtT6gi8oyPmlJ+cRUS7EU7MHE
	paOa8GvUFel3Ip/Y+IXgw93rW/cipBG81CBsVMmuxwCRL6uWEraSlqbKVBRapQrAaycYm6Sdwlz
	j6btEeF3On5K8B2y8Rg8HzjwYkZgFzEi/MAcv9y7uZS10uT9MhEMCEsIITFipjvZIJtvv9jSfI+
	XQw4oKqicPHEugYj2iCi8TrnBTvwqhZ7ZTs+SOW615rNPM1FUiRD/cwT6+/3/OZUTggECnZqLe2
	TgoOP+Hdkr2MrzOoWwGNKk=
X-Received: by 2002:a17:902:c949:b0:2ba:1c2b:4d9d with SMTP id d9443c01a7336-2ba7908a658mr19665375ad.17.1778057180790;
        Wed, 06 May 2026 01:46:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2d72dsm18985145ad.25.2026.05.06.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:46:20 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com
Cc: alexandre.torgue@foss.st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net 0/1] net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in nvt_set_phy_intf_sel()
Date: Wed,  6 May 2026 16:46:12 +0800
Message-ID: <20260506084614.192894-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014622_618662_E782E4AB 
X-CRM114-Status: UNSURE (   8.26  )
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

This series fixes a NULL pointer dereference bug introduced in the
initial dwmac-nuvoton glue driver. The struct nvt_priv_data::dev field
was never initialized after devm_kzalloc(), leaving it NULL. When
phylink later calls nvt_set_phy_intf_sel() for interface selection,
the callback dereferences priv->dev via nvt_gmac_get_delay(), triggering
a NULL pointer dereference.

Joey Lu (1):
  net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in
    nvt_set_phy_intf_sel()

 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0


