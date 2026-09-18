Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF6C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWKD/UjAbfhc4ufwKqglnF54JbL9r5nugGNbeX3aT9w=; b=DI9VAZa71WK3Ap6uuNdxHAOwiJ
	GpzX+MoYr9Hbuiwsp1OCTdvF8Zj40zh9gn3iTDj1N/VnES8sWFSVam07bp+Tskv2fuZ60gnGlPn2I
	kL0uQJnPH3CuomflyfSD7WO52lp3LnnQhA+cq7ogPwSf4w+ZaYDUsaXp66+JUh3N0tqFp5+6Egg5L
	VOjpcrIp+UhdVpWfamn5SpU4/RWLI4iH5XuN7X1r/HpWlQNINOp660GETto0isACD0VbDPu7m0bRf
	/Cx93bV1aJ5zknA2hCQgkyGKUNwNcha0Fe7BGJqtNx4acDhZ9h/bEJDHT9PPRHQFI8GpLDzQZ2qSi
	YoCLpj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkY-0000000F4uN-15wf;
	Fri, 18 Sep 2026 16:47:46 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkV-0000000F4ss-0oQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:47:44 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469a34907so1181381b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750062; x=1790354862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWKD/UjAbfhc4ufwKqglnF54JbL9r5nugGNbeX3aT9w=;
        b=h7AFiXXUgoDnT+Pr9jA5nZQeY0D2/JwaWl/tH7BvkfO1MHdflgBYwWeJmNsFOUjFkh
         zMZJ5TDRx/N7CQUIeAPtMxoTpBPvFJSKUsPfciWFdRkR/qnvD00S/WuvFvsP+zO1cNhN
         C5DHWMWLYfb+IiQofNlTMR5xXYuyBiOCHe9uMBJkexZFE9HrHJaq7+0CGkwvSIpWnzA6
         ObqIkyo9u5sLlJ4ANyYykANsmPgL2BiorXXHVr3hQpFLNK+xpOf39++OHPK5ELTLI/X3
         444QGMuXMbr4A5dy+Z9YsRyt1qq8A7IzmTCAGFVMbh53cKekb20R+ZUtmGXMa/TnLeEi
         hknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750062; x=1790354862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWKD/UjAbfhc4ufwKqglnF54JbL9r5nugGNbeX3aT9w=;
        b=GEJjiz6/KGZPJC/dN0DjfTzOvwlgocNRQZZqulwLhKN2qUnzdBooYwq655hNMwUI0P
         k8eTzPINmEZVV+OTFHIMfjNPELYnTRYvVbXCuL8wRCrg1OwwWdfxJkQNlQdb4Dtg/DgO
         fBStUT+zITVE/iGhsuhLmNUfTKOd5CpeR/Lm1weQjPVoSYTnbvpXufBlkInUVfMdnWEq
         98rnXOy7LiNcJAJAMw9YNiNci+7AnXNqQQSZuAfI37m0nhVWPpoZ2uT7zflc01fhtv4w
         xO8n/D3CSn6j4fKEzrNr5i/j5WATms4jKOqH5Nd5bLfbZqj1bYaRsgzbOaRvrV9mAbBZ
         jfSw==
X-Forwarded-Encrypted: i=1; AKwUvBxi9ra/ijuA9dVjttEewOHTD9MvMBrXkQk8DHbWjD1XODnMZCWGvjDXsBgkA5FU6gsycvxVRQ7HbHOs6xCNDPwH@lists.infradead.org
X-Gm-Message-State: AFuF++mTu3XebuaD0dfq1cYCbfCQBRJVBSq8bt4Klw4GM4YC5+sN9g0D
	Q9g3H1tL2mTcqNNQJWz5OJbBzT9P+IuoVFAbmpKBhFuQgpWtRAN6lYNy
X-Gm-Gg: AYBFou1Dcv0stBgMFUF0fBZlzn/awtAjU9KKcMEGGeYDP/JNgZcQB5GIMnCVsadX+xM
	BTD3iVi13HkOg6jS24JrX0hNahoIb8zhAHz0OV/C2u+r2LLdKxydxoUHzdBVl4Gxy9ZcBpi/gJa
	ReCRPacz1lMNK+IFpMMNdr1QQKf1mtarHjwIUek04Z4Bg0QhRRBDxZZ+5UDfSUGb6pYxBLCMwh6
	0OattfULem81+8Gec/DaTkeQJJm0bHXIq7o4MVpZiZ6UMcEeM9sL8M11oqiTCO3V5LEJJOCw+B4
	pROJLUbKAE1oTiDaVklv/yhyV1YgJ8o/zsmGcThocb+TIPD5OdNpHlKL77k9it729ey+mAk2dr2
	jwefStbXAPdNgd+8GNpkRAsIMGs5aS87g3AR2Iof/tOVkvj6jdRrd3lPN0DGqzm7Oelm4dDWn14
	Ouk3EB8WeD+NLFMKZ6zyn1mVtPge5FQOttP+aIAwMhBwLyjNFJWalWowcASagPKofx2XzyxtnV
X-Received: by 2002:a05:6a00:f87:b0:86d:7462:414a with SMTP id d2e1a72fcca58-874db8eb145mr6579181b3a.7.1789750061944;
        Fri, 18 Sep 2026 09:47:41 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 19 Sep 2026 00:47:04 +0800
Subject: [PATCH 2/2] soc: apple: rtkit-crashlog: Add support for AArch32
 state 'CrgA' section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-rtkit-armv7-crashlog-v1-2-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4198; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Y77Z1J3VIhFnhKwdKSgUSyUOgqiXcpPLGPr9pLwn6OA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWsk7omeMzvdcitvH2/8gz8Yi+jaRw/Tk4IgI
 5534I+qe7qJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rJAAKCRABygi3psUI
 JEK0D/9Kfa7Epjlhe9qqYxU2jBhD/ZecorVNyE0jqtyJshS01kR+G55qbyUSKIagHwbniwuAsl+
 odn+CsCvydbje8Oso042k1X1wlgngDBwMFL202WWl8rw9yXmnp7YqO68OYZMy4Hx7Yb3AkiaK5O
 +q7Wl5CF/GgG8kmlg5DuC2pNCyVTi5tKESXoz6UoVhZqrUkP7nFZs63/9oxBFnYbabY0flUvXJf
 ZoNzQX2LTk0jp44E+n2F0xVngzMZzU/J6hDh8aUUFav91BxuOTBqt9uT6Fs1tOAlSH9W6Z6IEWP
 KOPP/oxlZWVpsq0+8wXzmbIDaCMR7axhCIm6/SE6HUhdW2hyeFWuMBfhNrBOaAXwf7L5o0yYX4l
 wOiMLNo+StR9SlSBobAbPwkFWYi2ccI8VApQnkjoy7WDS0HmJq5VzUgltq8gBu5s27HFLePjzAx
 7MRr2a2z6SJmuk0PjoJNf8WkNI/W84fA9cA1gsJUsBEPOQF8sd4O0td6uKOgnULPGBXtE8XsMN/
 ZKwV3D2AvsZoKjVvzPNlGu1Ug/p5Qkd1MWXkf0tnCRHAngZYRQ+lFeJ2w5ppMym3kAHLhHvP7zS
 qqmqkFv15Pv0EDpROnVPfQi+lyt6Pn4KS0gHNZ5nvYZO9f4ghN7j1vgcGbObDr0FmA5403IrkwV
 mcbuhp+SNze+7Bg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094743_244374_3D398E50 
X-CRM114-Status: GOOD (  15.37  )
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

Add support for CrgA section containing the AArch32 IOP CPU state, which
may appear when an AArch32 RTKit IOP crashes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 96 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 6a8273e81e61..195b7869ce58 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,6 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
+#define APPLE_RTKIT_CRASHLOG_AARCH32 FOURCC('C', 'r', 'g', 'A')
 #define APPLE_RTKIT_CRASHLOG_AARCH64 FOURCC('C', 'r', 'g', '8')
 
 /* For COMPILE_TEST on non-ARM64 architectures */
@@ -25,6 +26,21 @@
 #define PSR_MODE_MASK	0x0000000f
 #endif
 
+/*
+ * AArch32 mode definitions: APPLE_RTKIT depends on APPLE_MAILBOX, which
+ * depends on 64BIT, so there is no need to care about COMPILE_TEST on ARM.
+ */
+#define USR_MODE        0x00000010
+#define FIQ_MODE        0x00000011
+#define IRQ_MODE        0x00000012
+#define SVC_MODE        0x00000013
+#define MON_MODE        0x00000016
+#define ABT_MODE        0x00000017
+#define HYP_MODE        0x0000001a
+#define UND_MODE        0x0000001b
+#define SYSTEM_MODE     0x0000001f
+#define MODE_MASK_32    0x0000001f
+
 struct apple_rtkit_crashlog_header {
 	u32 fourcc;
 	u32 version;
@@ -60,6 +76,20 @@ struct apple_rtkit_crashlog_aarch64 {
 } __packed;
 static_assert(sizeof(struct apple_rtkit_crashlog_aarch64) == 0x350);
 
+struct apple_rtkit_crashlog_aarch32 {
+	u32 unk_0;
+	u32 unk_4;
+	u32 regs[16];
+	u32 psr;
+	u32 unk_x1;
+	u8 stack[0x100];
+	u32 unk_x2;
+	u32 unk_x3;
+	u32 unk_x4;
+	u32 unk_x5;
+} __packed;
+static_assert(sizeof(struct apple_rtkit_crashlog_aarch32) == 0x160);
+
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
 {
@@ -123,6 +153,68 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
+static void apple_rtkit_crashlog_dump_aarch32(struct apple_rtkit *rtk, u8 *bfr,
+					      size_t size)
+{
+	struct apple_rtkit_crashlog_aarch32 *state;
+	const char *mode;
+	int i;
+
+	if (size < sizeof(*state)) {
+		dev_warn(rtk->dev, "RTKit: AArch32 section too small: 0x%zx", size);
+		return;
+	}
+
+	state = (struct apple_rtkit_crashlog_aarch32 *)bfr;
+
+	switch (state->psr & MODE_MASK_32) {
+	case USR_MODE:
+		mode = "User";
+		break;
+	case FIQ_MODE:
+		mode = "FIQ";
+		break;
+	case IRQ_MODE:
+		mode = "IRQ";
+		break;
+	case SVC_MODE:
+		mode = "Supervisor";
+		break;
+	case MON_MODE:
+		mode = "Monitor";
+		break;
+	case ABT_MODE:
+		mode = "Abort";
+		break;
+	case HYP_MODE:
+		mode = "Hypervisor";
+		break;
+	case UND_MODE:
+		mode = "Undefined";
+		break;
+	case SYSTEM_MODE:
+		mode = "System";
+		break;
+	default:
+		mode = "Unknown";
+		break;
+	}
+
+	dev_warn(rtk->dev, "RTKit: Exception dump:");
+	dev_warn(rtk->dev, "  == Exception taken from %s mode ==", mode);
+	dev_warn(rtk->dev, "  PSR    = 0x%x", state->psr);
+	dev_warn(rtk->dev, "\n");
+
+	for (i = 0; i < 16; i += 4)
+		dev_warn(rtk->dev,
+				 "  r%02d-r%02d = %08x %08x %08x %08x\n",
+				 i, i + 3,
+				 state->regs[i], state->regs[i + 1],
+				 state->regs[i + 2], state->regs[i + 3]);
+
+	dev_warn(rtk->dev, "\n");
+}
+
 static void apple_rtkit_crashlog_dump_aarch64(struct apple_rtkit *rtk, u8 *bfr,
 					      size_t size)
 {
@@ -230,6 +322,10 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
+		case APPLE_RTKIT_CRASHLOG_AARCH32:
+			apple_rtkit_crashlog_dump_aarch32(rtk, bfr + offset + 16,
+							  section_size);
+			break;
 		case APPLE_RTKIT_CRASHLOG_AARCH64:
 			apple_rtkit_crashlog_dump_aarch64(rtk, bfr + offset + 16,
 							  section_size);

-- 
2.55.0


