Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A417E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrWgmrs35qmM7zcBJM5ziQC8fwc8DVMRLjP8FP/is9k=; b=NKjFOTJnI8VAoRUA/SjLeLkVCN
	rsxPpYpOqDZmKz1LQudz5NsmJQbGUDaxIQkolcLU2/Ekz6TSD4fbFVqjlxIsbhJ+1u1ch29F3CKyX
	IdzKkW3pQpxtDL8xUzA1wKH+mqZXqy6/qexfT+Jy4G0x+eRftbVNFJ5zTTKNxYSqn2LUFzHrXIxqZ
	rqrg1buBhUGCRgRKpjIwbGzb5a/hrFpUTNuK8KepvwABh1H3+oEgmDOEWDNBkw45sIAXMk18Hbjrx
	1juVxRSiQO7u5QTWHATq22F1Dji7qoYFQmRZV3aQPYU9OViDxKZRSGbr6M6kcFFEFqood5ZZGnO8P
	GbKGZUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgUP-00000001GN6-1Q0L;
	Sat, 11 Jan 2025 18:45:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgRy-00000001Fc6-0tDI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385e0d47720so236733f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620988; x=1737225788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrWgmrs35qmM7zcBJM5ziQC8fwc8DVMRLjP8FP/is9k=;
        b=ISVulYMmb26/VQjIx/ChEEZw3cHWy3h3txV0DKHBEUUmkQhiroPDO9sFNHm3FM2NOl
         Meg/e9rqz3j6REV8EbgAPUglYY4Ien3Guz5hKHfPjuJ7LWANH8gTjiVU54kr7NUmlLOr
         ybVoPOebH93hzS9e+mG2AcEMKoKOmKWEny2WTKLzSIkHJiDqWv/h/Fe5ortOwGAokiI7
         2p3VFR8FsvqD6QVBWUCIO9fthtCKUh7G4uY9Y9Li1ohoeFB3uUpWrgi+DQDuRENzxfVU
         7fPldWyWIbiJ7LrPCwJpSNlz1nOrC/MLAyrs7v5qTsk4tpavKAvNnGWjSzKTwyxsNAls
         /QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620988; x=1737225788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrWgmrs35qmM7zcBJM5ziQC8fwc8DVMRLjP8FP/is9k=;
        b=spUUTgH8jymmlp2sRuz6FVKrluQfxtljcMA3M6VotB4845cFH31byb5lzLKg+ywe4d
         ukqflEWrlOqTIlC0vVXO40M8ibD3V1vxT+CUDWS4/hq9sVpektL/IqL8S4VQnYdCm/Fd
         pT60KMv4eLxqkjD88uuAx4JUPN1E6MWM8PRE6Qb2F0A9vFsIcXrAFLxgTf6Jy4g/b4jZ
         wEdoKMZgMqFLriUJVdjJ3s6Yk/9krJvYGvZLvlV+edZFKdIA+94eH7CEHOYAqmUStkmi
         Zvi0CgRYQzbjyCDJt+XEXjb1Gew708KsoAByVsmOKNxSRDBV6jxjEsEN+dJoc8zw5gDn
         +D/g==
X-Forwarded-Encrypted: i=1; AJvYcCWTwTqvIsPFBnlti9J3gDPbsemqdiaAwg6SmtRX4l7fil6M1fjHbO35Zy/GbDXA/1JkQbpcRQIR/ON7onwoqlUj@lists.infradead.org
X-Gm-Message-State: AOJu0YxJG04wjIC+h5G6fCx+fPzseqTsef1xpw0SM1bDJ5eMSSCOxVwH
	uemtv+3QzD0Hgd0Msc4PMaFQEURxVBeGjgKTCnJwD5TFIc2s44GYGGKILoML5U4=
X-Gm-Gg: ASbGnct6pJ3hlrOIxFPPXVu7aWe1xR8pEsvcAzI8bGul090lejcIXp6o5EZ5t641Iyi
	Ww608STUiydPiN1uf22NB2PjAstAiO6byZ9QuC70NThwLvhdYKBSeMn+BElTG4ZGTkRvV9Xz2Xu
	/cJgfWoqfVetWrobXBx3axNOdezn64kgDPT4kB7BY3yvnNGk6iySPiofvkQQ3ZGOqUrckITzAEO
	I0PfUWW/L9n2TH3D/G6AvpJg+dNXEeItzSdyLJMKSHI1gMvwtn2dWwrhdD2T0oeRGojXsHz
X-Google-Smtp-Source: AGHT+IFKDnROQFshibfBSRD1Lf3riCi0exaKnWhO407hgCFDnzE6W++oH5UDeHTKmJMD9omzpTVJLw==
X-Received: by 2002:a05:600c:4f03:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-436e26ff7famr56841985e9.4.1736620988522;
        Sat, 11 Jan 2025 10:43:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:49 +0100
Subject: [PATCH 1/5] remoteproc: keystone: Simplify returning syscon
 PTR_ERR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-1-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dxtKqbdRSIen5PNncZ7Djuqqg+VHZ66erVjbW40h3Ag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruxgmXjE2NenPQvILvqAG52ACPXhjQMaq/PA
 y+Mf4jh0fmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7sQAKCRDBN2bmhouD
 17TWEACEqyJNLB/LphpIvS2gKLrGdhyf+saL3KcUE2FQkE6z+o40bCffqSAEHgcaCVxCzURTM6x
 Bqz8k/RXxeMwQ+rHvLRbOS3cbtI2KRJSYQAmilUBHpSRMNuqPzNVTbOIXdjAmEMVYXrV8U5I+UW
 40OcL61dEQsfnLkT+OywO22JSX1hWYYqmj/OavGgivZiriwr85OJrqI0chsTmGUxqWe3vQrHxhh
 6kHn9ifUFxPaUsZLnmrcWOvWzuB93Hl/Z8NTmd+za/Xw9CkYs1oNWOZNteeLQoeh7M4izktjEPb
 wfGb6/RwhEN7XQbyrKiINfzoBPldqiVnrZ9M8pN2SAavWdRUlE8vmoIZBfgNaLnvDyp/nxT/Mju
 XW2WlVOocPc24DoQS6LhvWyCMww63DBPnpL3W83ECdcZahDdzinWFF/G4EdfZfQ0iwQpnGM8bYM
 oIXuxfV7XR1rX1sFC9L46DBybMDiig+YtreFlVN2sz+ZrvvPF2hOsQPfddA60Z6nTWDGfZMwr0F
 IO4uAUkQfJTq8xE16NNFwik6aEgOiRgdi+2Lp2G7tNoz5062D4z2EXKQVC7fRpH8S2qbXClz2j4
 Ayu/WKa8rwbi0O/SGedETwp2Mv4EgJMRCpAxpioix2tmoyFISTSwuEba8s2OAm90o1h8h+JkaOw
 h9GFaheuc2AYC9A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104310_254821_FED54AAC 
X-CRM114-Status: GOOD (  11.66  )
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

No need to store PTR_ERR into temporary, local 'ret' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/keystone_remoteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 6e54093d1732314d234e85bf6cf7fb6f1d9bf994..83c8e568f7ce3ec3ca3a534d2566f6437e9d403a 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -335,7 +335,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	if (!of_property_read_bool(np, "ti,syscon-dev")) {
 		dev_err(dev, "ti,syscon-dev property is absent\n");
@@ -344,10 +343,8 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 
 	ksproc->dev_ctrl =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-dev");
-	if (IS_ERR(ksproc->dev_ctrl)) {
-		ret = PTR_ERR(ksproc->dev_ctrl);
-		return ret;
-	}
+	if (IS_ERR(ksproc->dev_ctrl))
+		return PTR_ERR(ksproc->dev_ctrl);
 
 	if (of_property_read_u32_index(np, "ti,syscon-dev", 1,
 				       &ksproc->boot_offset)) {

-- 
2.43.0


