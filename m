Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4987FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CApY8Np2oV4416ggobGvSdXqIAdQQmVHjuoAm9JeX8c=; b=098eMIpS+0+yy5TqwIyIqgiJiK
	hcGRY8UO76nzJlDSCHTZgahA0DfxMyWSqZnYg4MaMuUSz/Xj6vWSv9Clhz0d+ef2awfoweYnGNm30
	17PbY34k8DxFKc4GIfKBLoW/d4nfqD7bZAkme9Xok46oL6lGpIbAWx+klmuEGggaslLqPyKhXQQk8
	H/91zNKa4DajVcHjUzYo9Aekm6fQ+pT62cbmfE9Hoxekxk6A9KLYnJkklVoMNGOcmdy7FmfARPatv
	K53+z1BzxK+3Xg32Jg0D5GMcRDm1OiZiUXNE4Au7oZ8Ltk8085loyKJZukits5UogqAVV8PM/KAsw
	jBayYaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfbp-00000004iCr-3NDw;
	Sat, 07 Mar 2026 00:33:33 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfbm-00000004iBf-2T3A;
	Sat, 07 Mar 2026 00:33:31 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 2E6DB1380A0D;
	Fri,  6 Mar 2026 19:33:28 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843608;
	 x=1772850808; bh=CApY8Np2oV4416ggobGvSdXqIAdQQmVHjuoAm9JeX8c=; b=
	QGRkcMAfcY/ghrQGIvoHQmM8GjfwwdGmJmoq1FOLB1bs86wgq7LDd6Uqhe+DK1VO
	INpqtzvNaG/ZKXM3yEo4lnyVRB16Px522AQxEnVj6mQHJk0atS2fzRTC6bZSelu1
	UGvKuEbggfk3k4EwB6V2EAdXLCtuMsvU5zrRm2Jv146PUrindkF58sYqpTf+ibTp
	pn60SRFqe4bNhZVtZPfKSfkNWGUSbOXjyrN8Xb1HQQacDCgSRNeaAP615Brn7ljB
	lBJBIvo9NNrQLqpOM6nK5PLS0NuELANpm/JwmEpfjdH42AmC0ZubTC09bxzG7tad
	aK0RffcQUvS17fWrbtSDeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843608; x=
	1772850808; bh=CApY8Np2oV4416ggobGvSdXqIAdQQmVHjuoAm9JeX8c=; b=C
	wX8a0niabfUFHJFWXR0A9+KecDCUoXVd3d5qxTZzU49XQS0UUU5zYi5uWm+DvBQU
	gPU8UOXd2P8DRyg0UErtZ/CMq5iuXRnNDPIR6h43aTjF61wXwOVvHSf9oGFDJyZS
	igGFy+tsJfVxu8xbCKtTc3b1J3NtGBtMW0bX5/Ul8a4eGnfe4+MvJuneTLmztbea
	YLpYxdZWBMjLKaJW8ql14XPBtkV1Gob+GyZxbjcvyPXuFoG7hNuRgxapaFBuDGtP
	T1vZ2uLW1p6aDvgRUMy7hFtHZMCwi5i42r9XrBkTT0FEvCUdlXWz6fZentRIakxr
	WaR3/PAJIYyNqbeTfb5cA==
X-ME-Sender: <xms:WHKraQIyKKCKJWoF-8cejLuKwhHn_L3lQG__dFbFNqwzlpBiUZT5eg>
    <xme:WHKraa_qcf8GYwiCxC_QCZifo3hiVwiV1ffViy6pca7HzKkG5z-tlcoP5s-GCZsux
    2N9pfukgYgnevQx26Hr-JqpCQiMNgQxTfKdOoBNvpg3Yl3okqCZC74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:WHKraYIiEz3BUqbsHFLg2TkRiZjeUMS-P-w0RJaEfPHAydxaRPEEfg>
    <xmx:WHKradBwT8Dxn5gZ15ITggGhLLZdoTIFjIGOiwfhwqUi3Ux1WPFbIg>
    <xmx:WHKraWT5GfnIhcS3tpYPn5JmLfsER3ihUkEwLGyF1R1IQ5az0DManw>
    <xmx:WHKraXfX8RJzyVkv8ti0sKcBj3Gm4ZWP1rnnB3Hc1nweEuD_WQ0nxA>
    <xmx:WHKracUf5B8CB8vKtI9Zx6PHdAO97cEVMUAcQtEDnEsdpnU5jiXu1O8n>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 058661EA006B; Fri,  6 Mar 2026 19:33:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:20 -0600
Subject: [PATCH 01/18] wifi: mt76: mt7925: add MT7927 chip ID helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-1-c77e7445511d@jetm.me>
To: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>,
 Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Javier Tia <floss@jetm.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=floss@jetm.me;
 h=from:subject:message-id; bh=1AevVC/l4SWg1OI7JWyQr1m70K/Jf4abzrWW5VnF5BA=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPxiLy9/rnyv8/hU2nOrG1NZ1F8LD/n7PFx
 Bh53bFgIQSJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H3uvC/43mvQr4QalBZx9Pbd2/1hQVJJQ5Tl5fu0Ffa0NvmJm5IPtXgPaLXGHNFON4NtV47j0A1O
 VwFB5TLFLuHu+au5zpXARB+apbqjm6yxIcfKqFFUAP+cll7hFbFBLcrQebAJG+6C1NagR0wMg9V
 KsT+GAtJ2zqJe8xnzh/EeGMlMZpPmQqtnTgLui1AYrYBEWMlkxhh2ceWDMj+77UWf+MQNU0Zi6Q
 uMCthEI/VFEeFbQ62YUYh9Aywdbc94pg411Z1miGUPChPuLDOs1UFo2UU6SyE68esGjHDiKqpRQ
 L6d0x2YHZSlVSczopkhJ6DmUe8NlibVMDhNgu0anUMkNJYMc3dogNQfg2adAGInt9oSOSxupd40
 yMKE0nVAgh7cw9T3km/jJJdSg43bPkiZAcfqYx+N5pebffAdTgSahjLfaL7z27Y4U7WN3bq9VkD
 88Vrv+THzz6MwHiZsT6Q/3TwGmkSWzFXkTFfQA+fEKRhhvcRcpKNYe73/xxS0CNpd7wGo=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163330_690992_63DDCB06 
X-CRM114-Status: UNSURE (   8.50  )
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

The MediaTek MT7927 (Filogic 380) combo chip uses MT7927 WiFi silicon
that is architecturally compatible with MT7925. Extend is_mt7925() to
match chip ID 0x7927, and add is_mt7927() for code paths that need
MT7927-specific handling.

Also add 0x7927 to is_mt76_fw_txp() to match MT7925's TXP format.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 813d61bffc2c..bfd5b05c2b20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -174,7 +174,12 @@ extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
 static inline bool is_mt7925(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7925;
+	return mt76_chip(dev) == 0x7925 || mt76_chip(dev) == 0x7927;
+}
+
+static inline bool is_mt7927(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7927;
 }
 
 static inline bool is_mt7920(struct mt76_dev *dev)
@@ -272,6 +277,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	case 0x7920:
 	case 0x7922:
 	case 0x7925:
+	case 0x7927:
 	case 0x7663:
 	case 0x7622:
 		return false;

-- 
2.53.0


