Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447CCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=; b=d40uxF8ywvYcRAerrOLsTdaQzu
	U43Ex3/MUyl5KXKvIPc0ZMh6u2WjDsSt7/MLvRTSw1gzqH+vNPL4JmToMnP/vEBoia2oH+LpX3YxM
	1IILegeJq04MYv8Cu/mi2UaUnhRK5Hi0KNWt12+fmVP/WD+BEn7VyXQ0jU5HpWC+8N+ebI0QEvCpm
	LjWngqlYcTFTqzqMs9NaiGDoeuLv+iIjFjM4d03g88XuBMniZwevc7DQt66GcuTTdFAvdWi6U8pr+
	GZVe1p4zVSsj2Gqu/S3byES4u265zrKAMhmZmKSATftPbQNljcWSXC7B8cMtc13aEu3ETW4p19/Mm
	AC81rsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyx-0000000EltH-21tA;
	Sun, 04 Oct 2026 12:06:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyv-0000000ElsW-3PGZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:06:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3a7d283e017so208523a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115577; x=1791720377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=fvVEgf+106kflCN4F56W/9vBxxl3isH7Bodov3r5yk0FyTTAv47ufDdEO2tZvc1Suv
         qyiTrebcN+r9bl9Oag5fstydgRjV3n3xufZeawzTaacGmFsJ6Y3CDfGSoTd72H/KvE+j
         MbRwfkRNG73Qg5qAYEQbjiy/S+/374K4yPwMSdTuR1rCX1vS4Z4HiGgk4jlVj4rSo+g+
         BUh/xp4mq87PjK37wRivRFVNfr6ZQaET26JMg8hm3crkEw9M7AHH18LYw4q4PO5+YKaC
         rvbVZFXAu+IGW6OMLzSm0m1XHQFB9NO9pR1GOaYQ/Rm/Dc/mqANap5hJ95QrUCXxKXB6
         ds2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115577; x=1791720377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=K3s31jDBaGeDKpt5EXodtM5MxcZ0e23IuXxusQYA0ukOOttYf9dWZrp3pzdz+HBhq9
         j6Okdp8QO1Wrj1Faexvp3A66omYmf+RAu2DDpvq9X5zYqPBEM6/29QnSYXLI88JyvHNN
         WFdXRNNJQkI/5y3j8HAC2Sjgj7CjII7ndpaqx7YpvBH5meV2EUV1O2fM3MDKmplWuH9u
         bJf7jYDjiFErCavlqO9L0/0q5Y9XUb0WPPk2rtePs58oG0LjvET8Bkt4IS/pIYlMRznS
         6v/kx8eidp2yDidRFfCLJL/WhXPP5cpmHrQBo1n5y0/i4Dj53IBWwFnZMoSy4hF+zuLp
         tE7w==
X-Forwarded-Encrypted: i=1; AKwUvBzmMdFjnvj/gpObdrfeJ0beYvxHx+1meNqqQ09XWyO7B24CIj0hIbq7qQjgSSS5LdwWc6ZpNJTWFyAJVtWws/Qs@lists.infradead.org
X-Gm-Message-State: AFq9FYI2ilZqDkb/J84bT2XNurJORAfzbFjzF9zoY+oHgIaScBNJz+Tn
	9m0cBAmeeqmwhKcflTvb1UxY5IXMQP4QoGzXBdmA9wpiGeFC8k87OE08
X-Gm-Gg: AYBFou3fHhlBOmYn4Cfk1B1I3X9eYx2hOCK0XNNQXkeyAeRiE6C0LwpxCDFagfuk+K7
	sQswXE9cBJYuDTYq+oI2WrJueP1npA/q/FxhUuDzzFhZUMA+DKfFl0olt/FaqwYFl/EzQGxd4ch
	XPGYQBNhtX4o1Gpp/YQ7TyK/pW+e7pgkveiYq5BneSOi2h2U3sVVcwKfoImvRVcGtz4u/gSjshy
	zci6ssA9Ue0igx6AvNLNxbMppmSYGt791QY0Jy7FD/tkosV718a9/kZ6eoB/S3Ll4+bVQVKy8e2
	aKkclfx6W5Gu8LpoIhz8iEzuouUBpFI7xJb+wLmDCrU2Jg64CpIfbldUvk6QxrGiPbaMV1x03so
	XHSyhAeTNHhxCTr3IjC56Z5xT8Prp+hNWTirSuu+AIu5lNy+xa3ZhJqqCWsedCmVhwaq6py0DEp
	Ec2UqOW6A6wFV0G90Jn5BukLnYM6J6ZnDL6wTksMlmKWx8My7WGuij2ICkd91kHSaG1RjmnA==
X-Received: by 2002:a17:90a:d60e:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3a7875265bemr3132986a91.52.1791115576910;
        Sun, 04 Oct 2026 05:06:16 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:16 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v7 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Sun,  4 Oct 2026 20:05:25 +0800
Message-Id: <20261004120526.2728564-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004120526.2728564-1-zxyan0222@gmail.com>
References: <20261004120526.2728564-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_050617_884828_DB1146BB 
X-CRM114-Status: GOOD (  12.69  )
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

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..2a076e228e9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -242,7 +242,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1


