Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB7D167FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0zxZ5WM7PHh/aWTK9OatGXUnyFKLOlRWA2Aire8PpE=; b=0GJCfORiVi8MocCM5Le4euru6h
	bw+yWU5BJZutu2Kh1bNpWvkyOn/zdMFUFbvp0MR8lNNjUgW3pIRQCK0jMVsYn1uXFky0dpv5RBAob
	xx59Rli71SEt0g9xgzvJP0r1CCg0P0BfKDVHLJq0sURTNRkYFLn1UQu3YFJ+OONhwHh32DM23xK0P
	5rOP2W5kUIlOpOvU3lcxYHN0IdEcQDayWdvryNz7yvIE9EqSUPhgHHB3RdDeU60Hmr9TQJDixo9tp
	Sa2ffZVLuksMxoSjWa/2MC4xrAIVZk5dpgNEmyNnzvCGup0ey9E3Gnvv4tasSuXEjRjpRPNGUOzFR
	fLiZ7SqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9VN-000000026pR-1MiH;
	Fri, 09 Jan 2026 10:14:05 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9VJ-000000026na-2Rah
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:14:03 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 92E041D00194;
	Fri,  9 Jan 2026 05:13:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 09 Jan 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767953639; x=1768040039; bh=Z0
	zxZ5WM7PHh/aWTK9OatGXUnyFKLOlRWA2Aire8PpE=; b=k+fHSYkCWMggZNHmwM
	DjFBPqhtcDkYmG9ch9mFN4z3B70v+mZNGMu1DtK4hWeCKa1IYIGygNwoubZNG+rV
	KBcagyPyYnGz57n5+D+L8uDvTwW+uUYGW4Xi2PP72dqCfdjQ87BmM3yHSI2vGF+T
	OHDmQt/sVY4nsk6h/1Xu8YfBONRJ7U9jtWKeDhMV7KAusRgTxJnHd20NF5KVaFu0
	a2Bd5nHZzbroQ8sJtWtEPFtG4fkivYVqFjbMv2pNRB4IIMWw+zeTY+2YWhWOECwb
	MxnMDeYWkip7NYPZcobe6kcfQVxvpKheH5SU1/irQf9loZu+6Bt03rjbLku/19mf
	GUuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767953639; x=1768040039; bh=Z0zxZ5WM7PHh/aWTK9OatGXUnyFK
	LOlRWA2Aire8PpE=; b=pwkgTbrAeS7rlk2Fs572ImuS3ve+TrdWReM7uyTVhztZ
	StFc6fR9tF1dZ9P9hnV1eoIYR5O2b6e+6An65epah1Z3Hb8O7nwD7Zmdss+53rRo
	P2WVESaFxusak+nN9qS8ltHzPQy0zxHfg67A1QZ8BW56O3funjtuXkXrKS9L3qMS
	wDV0FQ21I5qVP9PCq5+fSGFGjCMsQfoGlejuV8csle0fa5w0kWmbZf7he3sRLsGJ
	vBloe26/o+0KCf7hJb4qMzYHElDt9ldp5dpdyMdM1qPxdO1LUfZ0zqZec7uhtlAQ
	mHkEZO6+2oHSR7ACQT6BwetyTb2mwFRg9uv4zuGRNA==
X-ME-Sender: <xms:5tRgadWC-GKRdNX4V-KSXFXP_xC9J2tCy9OcTh33z55yEiKWScJGxQ>
    <xme:5tRgab2YLx51MbeZ0buDClYwMZXyCOn2_sQ3X4OHWw7q9IT90L_YydtTUZml17z0H
    lzr9gVPVG7aPGE4-PXDh4RecYa_CGbR9bBMjrIeoJ6RKb851Q8Ujbk>
X-ME-Received: <xmr:5tRgaSsaCEmxhtDcIUJSebAU6KB8-S9ZgJGwS1nrSTq_eW7-Eul_CmaIUGMTjlA6ME9phFk2UXpnOhdDXmlnqYoJBz4VMOqwFN_CrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfffie
    ffteeuffetuefggefhgfehtdfhkefgtdejueeuvdevkeetveevvdffkeehnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhinhhhrdhnghhuhigvnhesshih
    nhhophhshihsrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrd
    guvghvpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5tRgaTWZfsADM6y4T_tLxasycPAyaBXWycHu0Yq1Vl6hwzov5HJApw>
    <xmx:5tRgaaz0M7bV1R-5Ve3da7CgO-yULFIw-6cjIU2FL-YW9aw5PCM8sA>
    <xmx:5tRgaSEgs7W8ZAXaUMMbmI1xHCoDG3PTjh9wySWVUMSVwmCfaMCW6g>
    <xmx:5tRgaXuN31DExD2cZpVq9JqnQoxc7gP3D1QJvlnGu_hkAsywO-s9eg>
    <xmx:59RgaStoczRy6IheGn8UitCtMoU27-dHQUibaCnr9AdE2A__Nn_vMH3t>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 05:13:58 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 11:13:48 +0100
Subject: [PATCH] usb: dwc3: apple: Ignore USB role switches to the active
 role
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dwc3-role-switch-v1-1-11623b0f6222@jannau.net>
X-B4-Tracking: v=1; b=H4sIANvUYGkC/x2MywqAIBAAfyX23IJm2ONXooPZVgtRopGB9O9Jt
 5nDTIJAnilAXyTwdHPg88giywLsZo6VkOfsUIlKCyk6NM7thHO0Cv2ZKUS+7IZy0m29NKrVwkK
 OnaeFn388jO/7AertVrhoAAAA
X-Change-ID: 20260109-apple-dwc3-role-switch-1b684f73860c
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=m/FrghxQ+IIR6+FVSne5p9YypfXduphdFmcFCuXksXA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyEK48VNCKZ/hgG7rmWkxnXOkPev3Lb8/kRjUKzlR7oL
 VNxzavpKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJH02YwMD4X8pH8tPXND0mCq
 XuS5SSHx5aKhOjWvti089nTPE13eBYwMK2fFyJ3U2P+M6e6teXf8A9wPFghqSLQHW5UXC3I7OE5
 mBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_021402_153694_2DE9E760 
X-CRM114-Status: GOOD (  13.33  )
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

Ignore USB role switches if dwc3-apple is already in the desired state.
The USB-C port controller on M2 and M1/M2 Pro/Max/Ultra devices issues
additional interrupts which result in USB role switches to the already
active role.
Ignore these USB role switches to ensure the USB-C port controller and
dwc3-apple are always in a consistent state. This matches the behaviour
in __dwc3_set_mode() in core.c.
Fixes detecting USB 2.0 and 3.x devices on the affected systems. The
reset caused by the additional role switch appears to leave the USB
devices in a state which prevents detection when the phy and dwc3 is
brought back up again.

Fixes: 0ec946d32ef7 ("usb: dwc3: Add Apple Silicon DWC3 glue layer driver")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/usb/dwc3/dwc3-apple.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
index cc47cad232e397ac4498b09165dfdb5bd215ded7..35eadd1fa08049829ba40651a96eb122ed55460f 100644
--- a/drivers/usb/dwc3/dwc3-apple.c
+++ b/drivers/usb/dwc3/dwc3-apple.c
@@ -339,6 +339,22 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw, enum usb_role ro
 
 	guard(mutex)(&appledwc->lock);
 
+	/*
+	 * Skip role switches if appledwc is already in the desired state. The
+	 * USB-C port controller on M2 and M1/M2 Pro/Max/Ultra devices issues
+	 * additional interrupts which results in usb_role_switch_set_role()
+	 * calls with the current role.
+	 * Ignore those calls here to ensure the USB-C port controller and
+	 * appledwc are in a consistent state.
+	 * This matches the behaviour in __dwc3_set_mode().
+	 * Do no handle USB_ROLE_NONE for DWC3_APPLE_NO_CABLE and
+	 * DWC3_APPLE_PROBE_PENDING since that is no-op anyway.
+	 */
+	if (appledwc->state == DWC3_APPLE_HOST && role == USB_ROLE_HOST)
+		return 0;
+	if (appledwc->state == DWC3_APPLE_DEVICE && role == USB_ROLE_DEVICE)
+		return 0;
+
 	/*
 	 * We need to tear all of dwc3 down and re-initialize it every time a cable is
 	 * connected or disconnected or when the mode changes. See the documentation for enum

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-apple-dwc3-role-switch-1b684f73860c

Best regards,
-- 
Janne Grunau <j@jannau.net>


