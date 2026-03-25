Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9866B109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm2ZuqonHhwc/DZnu4lLR/17g2z6GdlfDUz3wXwZcYY=; b=a6baXH1i4YgkcJEvUWN9+iJCzd
	Nl+KIXv3F9a/2ZNJF16TXlcgEt2KiA7JXjLp7pFW8B789aeUJON7c9HnsI4vAPNR02e1yV3aGu0Vb
	5bM6t2RVA0oX8gZaeKKUl3vxgR750OQJMaSCcAI/LrlIPWu7WPMdcVfhJSjeQCLIT8sg/FECpOiaB
	WliOIOHREK22UHxkZMZg4N0XCnQJOPoRzv5By/yShspM0f7HyYhR5s1OO1xvSBCGAdzh+nkJpHI49
	vpP0vJQ8hZciu4fFp29y7DVDihZ/s7xz5xJEtL+tJcg/5yOK8OyVTwmhHa/JfrTJus909K70vgf20
	aSARGRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XgM-00000004QWD-3HwV;
	Wed, 25 Mar 2026 23:30:38 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xg8-00000004QN5-49lO;
	Wed, 25 Mar 2026 23:30:26 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 9F0451D000E8;
	Wed, 25 Mar 2026 19:30:23 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 19:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774481423;
	 x=1774567823; bh=tm2ZuqonHhwc/DZnu4lLR/17g2z6GdlfDUz3wXwZcYY=; b=
	AUfx6m1s1UrD/hxxU85wqzRwIsLOPY6d8zUx6WS2ELengu+FiqoQKj8XR5zV7T4o
	G/vd8JxM6xqLAN2BhosYntWQmQ3xQDkIVeAHjrvMyRZGu2WX4o+MrCuVA5bKkusX
	ZrMeGiCkNNg6BJFiAL89qdAO2EtBKM/ckeJZekiVICQ5yeQl7vFTZ2y5J7gtm5s+
	9gqPDO5CwXt3uaH1PzR1nvpWFpJUFVEZHEqPP0dcolw9//JD0QZFjcwX0q1Z6Q3Y
	vSYvAbbCbHopF3cgJa2pPAPOxBz5lSEikOndF+5LfkaFEekwRtLBFQcHsE8ePU7Z
	QzLwTkU7lZzVXRhuzDWAhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774481423; x=
	1774567823; bh=tm2ZuqonHhwc/DZnu4lLR/17g2z6GdlfDUz3wXwZcYY=; b=Z
	ncT+HnshrXyD3B/FhrkPEiG05cZYIcZomErJCr/l3AqLxX6BB7k/Oqer/MGfoM4u
	aJ4R9uxq8y8nZAAKSfkVthk3IIEdkvd+KgsefXU2b33jJPxvRZvOmIIrQ52TzpYX
	0cGxk/yBD5fuH1PHQvMZp5XZPzFrsvp2bqqSe1zjpxX4NKV+GvL+HUOSt/o0L2s/
	EB0VsvFLce+A8MG1qRTOijnS1MiT2uTXBmG6if7zCBBKB6ll8jQjPBJ3zEoMZKJU
	wh5vBAJalQ20Yt30ufr+VmleLzK3L0b6F0G/PHzb10nK7zXn/uqM7Dzp7MzymVoh
	bNzfBmxK6emGECgJYglqg==
X-ME-Sender: <xms:D3DEaQ3CrYHmLaAqE7Z4TJzhCNJZLU1iyBN9iC7iOE-ljby0gHGPyw>
    <xme:D3DEaV4h3ljUHiZbq17LAH3MutSTzHj1FbZboXsGTNiImw2wcp2HEtHI0Iy2jf1IR
    q6qSNb9BNYXO56qxM5YcjcUtcssx4D77NPyGqycFOKZTH5pOwQ8yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    fghefflefhieffveevtedttdejudefueetvdevvdfffeegffeludevgeehteetnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    peelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvghlohhgihhorggttg
    hhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    lhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirg
    hsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigvlhhnrghgrgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohht
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:D3DEacU6EYrH8JbYYkD-MdgkrTAO0x0mdi7R5efC3bhQsIAHSqc1Yw>
    <xmx:D3DEaToFNHiD0IMO20sKM_5yxm-L0PTYSSmwtF9vy9lHqHRyt1Bxxw>
    <xmx:D3DEabAtbmSc62SW3FkeZNTso0H28NGzZgN_VjNlpzKbMJn0KHIa-w>
    <xmx:D3DEaXgLOFfOfEZkEAczEuhRC6AvFB-J-RwW_QXEuFDTn0ozWlcUKg>
    <xmx:D3DEaQcvSTK6LM5wGYem9PJIhvpYgDgcZDtYdqubJiDZajN2yyHTCMPj>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 52AE01EA006B; Wed, 25 Mar 2026 19:30:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 17:30:19 -0600
Subject: [PATCH v2 2/8] Bluetooth: btmtk: fix ISO interface setup for
 single alt setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mt7927-bt-support-v2-2-b892a3252880@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ryan Gilbert <xelnaga@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=floss@jetm.me;
 h=from:subject:message-id; bh=PKA6JAuHhBofd17Peep9P7qPZLwQxKZ//Y7wX8WEbCU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxHAKikqVsqs90XfI7kOR65NCQmIpNqC4i3mJV
 u27IvXeY9OJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRwCgAKCRC17sMLqGd3
 H6fTC/9K1VUX6xnS5nqN3/Wh1LeBdDDKZcuoO9OKzpc0/NRBMCq4MiKh9nWAaPikN4+IDtYCk1a
 Fo7fzwM/Ad/kj2x5EsZ3iVAD3WCJCz0+/e3BQ6M9NubY4vkvlHk7/3U6btTHmRN4aSorlxUVpLo
 nbPesfbMxVTIkMK88qKJsRfUluUu0u1wUbAmludcooUPuptw4OL27JIA/uP3NkURoW95z8ya+V8
 +sIywaFyqcOsHAzqg6dBIEfAYK31wipBaFKr19Gh/klvfIQ1vSoXnTdQscLWQ3XlB+Q+BwLGfmL
 VUcG1XxXEOl1P7e4btSSlZlL3NjgUGOYGB5G7R38wpdS7JfVYuqV54oadKQjt2+ByFnpuiJJVQa
 vcC9jDY75GRDTzb3fYckL45qXM4WFdIugcmKBafWno1dGLNKcf8Q2DdWLEtR10zBoTvP6zMUJhm
 bbDdoeVSElZ17wf5W1F1dXpT2k0DWhkPrOKF+eMcrpjSIewu0Vcn7ZrpJmM7w88WASlbc=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
References: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_163025_074569_F0E95FC7 
X-CRM114-Status: GOOD (  11.07  )
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

Some MT6639 Bluetooth USB interfaces (e.g. IMC Networks 13d3:3588 on
ASUS ROG STRIX X870E-E and ProArt X870E-Creator boards) expose only a
single alternate setting (alt 0) on the ISO interface. The driver
unconditionally requests alt setting 1, which fails with EINVAL on
these devices, causing a ~20 second initialization delay and no LE
audio support.

Check the number of available alternate settings before selecting one.
If only alt 0 exists, use it; otherwise request alt 1 as before.

Link: https://github.com/jetm/mediatek-mt7927-dkms/pull/39
Signed-off-by: Javier Tia <floss@jetm.me>
Reported-by: Ryan Gilbert <xelnaga@gmail.com>
Tested-by: Ryan Gilbert <xelnaga@gmail.com>
---
 drivers/bluetooth/btmtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 13c6e45deede..06ba0dcd6527 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1013,7 +1013,8 @@ static int __set_mtk_intr_interface(struct hci_dev *hdev)
 	if (!btmtk_data->isopkt_intf)
 		return -ENODEV;
 
-	err = usb_set_interface(btmtk_data->udev, MTK_ISO_IFNUM, 1);
+	err = usb_set_interface(btmtk_data->udev, MTK_ISO_IFNUM,
+			       (intf->num_altsetting > 1) ? 1 : 0);
 	if (err < 0) {
 		bt_dev_err(hdev, "setting interface failed (%d)", -err);
 		return err;

-- 
2.53.0


