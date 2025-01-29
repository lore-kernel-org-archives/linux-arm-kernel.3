Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81AC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9nE9z0SUMlLOuN8yKKtvs974secF3eQP+VTAp56kyA=; b=vuRX8HFeSqNsxyU79syia5m20x
	hjwAdR9UMB6JmhIj/sLKZEQW8sU9kMhNUGFxGFkGfKZggavvsGlEofQwdLWra290Qp/xwfqz1AueR
	q936dlh6plZn1RuangI83FOXM5/tuP7pwZdDGYjVXWh3I1wWTsAg7jlzwOuC/ZcZoImOLcN62Td6v
	kmDUNGfdTMAjadbCMDSySv+cEPTEI1w0FtqoI1buiRx2q0+dxDX4mdxiKdCADFw3c3hIldpgaMvJ6
	MQrJML7Jk2frcXnY6rPJZULO8wZYXV5VTlbC74nf/JLGL0yPkN1aH3ojx5Oce3TjY289hbMMdkgqL
	PVosu9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7wq-00000006zsJ-3Wux;
	Wed, 29 Jan 2025 13:17:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7uI-00000006zQZ-2GWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:15:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2165448243fso6284935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738156501; x=1738761301; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9nE9z0SUMlLOuN8yKKtvs974secF3eQP+VTAp56kyA=;
        b=cw2Bin8d148EYpeEqIPPK+7eQR0VnE8P++CPseS5F5BfEDPhBLhd8X03CFB5MS1oUn
         CTq9+2Zr3HGccjP+FQ80a298c3XFY0hoPZMBjvWCx8YYbYrDXbH9n2bJNv/ZXAbYGzVA
         bzQCcJyNrqp8D350u/EQL3WEJMb1/SwYA93b/dLMUP/MeXCF0kai1ACtu2dewqS5ytKC
         NhvImf+HzaqGWQEaOmrn5JKIqO8LHiHubgWxWvM8oJxXFh0zX/9UoB5sCaug3Gcz25Zx
         KtNnfCjEwIiesyWGyWffzFoYIaZKlK42jwtVUN1oKy+fAlgxYCs3s+B+oCccsrU6aE1n
         ULeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156501; x=1738761301;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9nE9z0SUMlLOuN8yKKtvs974secF3eQP+VTAp56kyA=;
        b=ahY9rg+PMB3MF+rEhLXVr9LE8kQ/RoKT+L5xxmry6Fcbm7jOe2AKDBSPG2mOQmCoY+
         apqk228RJQLyIrVarUsfO6JmEq6lDOwnHg0tuLnH+0MJI7rMrMMUAjSI+cBKnwaEdruG
         HWBnUPAoxnYla4AcKZOro1eV+is16hyM+WdYHvtJunkZ5v1QhAv7jEJofmsgDDIxnYm7
         qPHlnGSaqfvjNEZFgJVKKt2psm2a46GHu0D002PonCOgLHmwF+H666Uyud8rSsDZLquv
         RWv5JNTpSA+ss21WtKs7h3iAMnjD4brGX75XVFAgAu9R1FV58MvrIYT/cSW6QaiA+wSD
         350A==
X-Gm-Message-State: AOJu0YxTURuwvk8T1xurbiQuTt2gaR1GQcw+zABwzqhrd3PIxEMa93EZ
	JE2IoYWeXymZfscrh6PxbzlU6oreWk7Ci1Y8rpwKOIFvGn+7M5YR28xwAkfS1w==
X-Gm-Gg: ASbGncv67Hyi8549ALf+nkvnOzsMb3sCBUv+JxhnIjsuULef1D35mc0VUM7VkMCSlg9
	nFGcGq0zahjsRrrNgNki/mePQC+2Hb2PvxInzFUBVVIAH/CWCJ3IQCaTFgImIZkuBADb3Nbq4lM
	9om9szESN13TOL/t+hUgWv9aOvz2OflG44ENOlOQpHEkKXjCuR1JEPMs0EY26Qk8IIYo5M7sr7k
	7v+arCk6Z106eT40MrYadduhCGkMcdT9zMVQltn047dN3P0FaPl8plO8vzJdYa0Al8pPmX9kn0m
	5yRWxNL9gzHHhXn0R3yFRmg=
X-Google-Smtp-Source: AGHT+IGo+By892WRBgN61KaPN04CqoMjUe+suZHMWzY8xssYhrTGx+ecRnrjc69cTm1qhSbcbseJ8Q==
X-Received: by 2002:a05:6a20:3955:b0:1e5:dace:693f with SMTP id adf61e73a8af0-1ed7a47465emr5385215637.4.1738156501307;
        Wed, 29 Jan 2025 05:15:01 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d235bsm11167872b3a.80.2025.01.29.05.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:15:00 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 29 Jan 2025 18:44:54 +0530
Subject: [PATCH v2] arm64: defconfig: Enable gb_beagleplay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAM0pmmcC/4WNQQ7CIBBFr9LMWgwMoo0r72G6gDLQSZrSgGlsm
 t5drAdw+d7P/3+DQpmpwL3ZINPChdNUAU8N9IOdIgn2lQElGqnwJjyFPk2Bo3Bk40jzaNcqL8Z
 o53TbItTqnCnw+5h9dpUHLq+U1+NlUV/7Z3BRQglEe5WyNaSVfvxCl2z255QjdPu+fwDfwaJJv
 gAAAA==
X-Change-ID: 20250127-defconfig-beagleplay-de4553bb3882
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=orfWTF5RxSecgO69chSBFctG63M1DCzQ/Y7xS353lFA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnminRCGGDjHXNDHWUtAdlugBgl7Xdyk/OXgWCz
 XrujmY0mEeJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ5op0QAKCRAFzvXHieVa
 dA4mEADl1SeYgfqJY1ej4nQWj4utoNJeXFImmD7Z4LIiQ36rfHwiIXdmdMdWAhQLJZURytAJSvY
 TRd9ESh5wLOrRRxiPgarXwIVUn7U5sbERSJGqASR0XQOwUUjRsXfeKIhpvMjW8h9DzS436iU3QZ
 P/e3oe+Ih98dFr+xkrCErTNUac7KyC+dAZpLvQ5UFdC2anOX07nsGPSAoxsYInuG9/xw7AzsWiD
 +WbEtFlnwWih8NF54QA3Fel39dR5++zkbr4+hb2CvT0Owy4CKvcY/uJSqjpdUwYhYMp6pAxlYga
 YlUZWzch+InAqVJIk0U+ReVHFibno263sQw4UFWAIDTBMztCW8OzTqZ8Bc6TbkS87/OjKVcsPGA
 cIpooNHspvVX0ZbSjBrsw41cGCReyCXmIGKmyBRUV4szIgGwqFiPXT47PGippLxQ+QaJUsszFh+
 sfLDiBBxrDqQlzFxFhUS15pf8IuLSWMxtCtfY/yxDBsDbxqeWDOXF4tOTzSoykw89iV83ZwWJPl
 x9z1ycr0F37qvqxHalLjw9uNzq3hTkYw39EJYxYLyGVfVNHnZgyP/knx+K3dx6ODd6endfTDO5q
 Xw1qATcJuICkYgB17DZDdE15OavjMbMLY1YMBAMM9LEofko6W3MH1mw8EvKnhvdL9bIUlcM0k3m
 OCDNoYbiMgGnziQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_051502_850370_39400492 
X-CRM114-Status: UNSURE (   9.98  )
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

Enable greybus driver used by TI K3/AM625 BeaglePlay.

The driver communicates with Ti CC1352P7 co-processor which acts as
Greybus SVC. Additionally, it also provides firmware upload API support
for Ti CC1352P7 over UART.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Enable greybus driver for Ti CC1352P5 over UART used in TI K3/AM625
BeaglePlay [0].

[0]: https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
---
Changes in v2:
- Add hardware name to commit message.
- Use savedefconfig option to update config.
- Link to v1: https://lore.kernel.org/r/20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..62309fd2482ab35e917aea2e63780c45a4347f43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1270,6 +1270,8 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_GREYBUS=m
+CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=m

---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250127-defconfig-beagleplay-de4553bb3882

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>


