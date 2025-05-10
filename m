Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AE4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjT9QsFvecWPH6K1hTzMR7uGrHCdBy3p8DiOT7+COxQ=; b=SvVQcffAnSI6wBqOZSsm4O1x8N
	wfL5bKAbFeq9iALp6GGUWeB8XIPBw3UpW5ymCggwyKPRAe8HjT6NYTlln6S4KCqqIARb760BsWsi5
	CsduxQLRaSqqiN9LleYLo5hVXYwjeBtcRHkO/3HagHisG/gvfSsDL3y9x2edvAzSKubOJSxB9SqUi
	vVImplmHm69aoCSsDdWFZDYGk9vm1dksIjdQAki9aSnAn4OxBREn6MCXfkMbuDET9zjKoS8jT4+V/
	I71tEYvWU4g+N0S7ka7qjSea4JZAvnN6BjXxTUZd9p6m2KBPpW1/cdUkddML6SUq5b+Eh7QkLeBEe
	r3FcBeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkb2-0000000600D-10l2;
	Sat, 10 May 2025 13:50:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkYw-00000005zku-3FiY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 13:48:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3154266b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746884901; x=1747489701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjT9QsFvecWPH6K1hTzMR7uGrHCdBy3p8DiOT7+COxQ=;
        b=NC0Zj3KDHwJ5CgF3ZdrNGv3Tz98Mu2Iuq5w/2DVG7n5UXSwE3u/T+O/G9yEP1lydZB
         Uf7NXsYtE8XntyaBAOJmd1ALMHLilpI+Nij98HPsFyhXBJ3qsufm0yzPXvIuGxCBFGGy
         0GiCuWiTAdr2yUC13TIU5ULnftX+p1KNPlpLNc1AlrBjUaLX9fjrh8xbKKFsMNYZOw8c
         xLcUiaJFGyeI9oUu/AHfrTmZG/NlA0bJbgMEk0ldjCCb+8ia8yYnEiJuXIc6PWjmcE2s
         HG3h12Z3FprWII0EviWeNslsoNTDJahaB5FYQuXoWEsV7j0Z76zeSC5qbZjT1KW15H/7
         9OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746884901; x=1747489701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjT9QsFvecWPH6K1hTzMR7uGrHCdBy3p8DiOT7+COxQ=;
        b=M+IL49HwOXFXK7pxZIUJLdouC6mxPDCJbvp2611/EsD2GeMENP3iIYfOzbCALc5OdI
         KzrOMQL18bHPaSBZQRnSzrldugztN5Su/4/0OOEnZGAeRatJcdNALMEzRDtUq8qD5JPS
         hXzaM+PW+kuV/vU1uvpBEwp1faBaDaVY2GS+7QYzN8rl0f51IxtdtjyIdfM0xpXEsRZ5
         JFtI5Lsj8fSvryCcgPOXOFqRMvLRg7WaBn8x0EdNVgikNc9lu9HCzcoY3JwKNN0Asv5g
         alt50LrIfjitWg9PaQnwNtzUVzaEKrsrj7g+/RC1UrMNcov4QarjchAicFXGIVwdW16S
         ITiQ==
X-Gm-Message-State: AOJu0Yzzaaq3atseDDY6KmNzfA8SmcNIingts2QEXTW6PFdBjfRiYxoc
	dZYmKhFNpK8UmreHlsL9+AhfEHK1b2cTUueTo4YS0/ICtu4FuTnm
X-Gm-Gg: ASbGnct6x4kcQXu4Ckr7vpklO/kg6BjPDGepWE4+qYmpyFiyYLmUD5/QkLBhP6TUpVw
	BM3oJ/yrJCruYYP8brKnohr4NxvwXi//9YyxfD3DM+B+7D49A6vIDM8rg1NlRwuvMY57KUoKQVI
	Lj/ppTyPde4qOijum9tCRw+VxWmW4r1vu4fr5fA85cjRq40/u2hY2R1Q4DHk5rXClUerpEiozO7
	Ka3TGT9h3k6lAGdXt9aUiVB2h5/NwSI5SPSZRGGdVVf6C6VAVFAVTVI7t9xRAvxrv1wCM83A/xv
	OthJX3/VQNPbtH1ykas3IC8HDtnTnF7hyJIu/WAi2rTM8iQFRdF8yCd6Qs5T+riHDcYv/JKmT3i
	yXNCGQwr0OPzTfQ==
X-Google-Smtp-Source: AGHT+IEc5T1ipEW5XJX6iIwkxNHd2PzUnYMkA+7BJtGOAqm+kaFIn6p3BLGSLH7znczlRZNQEbyR3A==
X-Received: by 2002:a05:6a00:2d0b:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-7423c01f8a3mr9192135b3a.17.1746884901458;
        Sat, 10 May 2025 06:48:21 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([114.253.36.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773939fsm3360424b3a.62.2025.05.10.06.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 06:48:21 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: tariqt@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemdebruijn.kernel@gmail.com,
	irusskikh@marvell.com,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v2 0/3] misc drivers' sw timestamp changes
Date: Sat, 10 May 2025 21:48:09 +0800
Message-Id: <20250510134812.48199-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_064822_832356_971BEA1A 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Jason Xing <kernelxing@tencent.com>

This series modified three outstanding drivers among more than 100 drivers
because the software timestamp generation is too early. The idea of this
series is derived from the brief talk[1] with Willem. In conclusion, this
series makes the generation of software timestamp near/before kicking the
doorbell for drivers.

[1]: https://lore.kernel.org/all/681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch/

V2
Link: https://lore.kernel.org/all/20250508033328.12507-1-kerneljasonxing@gmail.com/
1. remove lan966x patch since it breaks PHY timestamping.
2. move skb_tx_timestamp() earlier than before in cxgb4_eth_xmit() to
avoid skb being orphaned/consumed.
3. revise the commit log.


Jason Xing (3):
  net: atlantic: generate software timestamp just before the doorbell
  net: cxgb4: generate software timestamp just before the doorbell
  net: stmmac: generate software timestamp just before the doorbell

 drivers/net/ethernet/aquantia/atlantic/aq_main.c           | 1 -
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c            | 2 ++
 drivers/net/ethernet/chelsio/cxgb4/sge.c                   | 5 +++--
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c          | 7 ++-----
 5 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.43.5


