Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FFCCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1FGc0c7Pyt79arhBSB2ZwA4aD4/D9YDuG4eKl/UZpA=; b=mm5K4P2oYglZ7RNhy8MxUwfFxo
	h7JvSVhn3UkfZhyx0AczCDXaqlxMDKJ0KWexgh5jouBK2dQq4uRZbOl7Z1YMniu7PwU9Oo9HB4idK
	5JBq6nbsZu+WIC2PUshCnLNCLolvldeKFtgbZHEIHVUHSAUks2W863cp2f+l/9A2Avtj5HWRT0fE1
	weiFDfHjuR4DqHbgY6nTygc+fbm5ypk7Vvcmnh2ztIZPIypmpN5Moq3rLd7P0wWyFs8e2PnI9ITXZ
	DmiYrnD/CoTijDfUkLjLCkT992Mq2R48eQFp65tfllQZJfoa77NlJcasV21LylKr+AjyfB24hrvWO
	rJh3Vynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aqm-00000005RXn-26ep;
	Tue, 30 Sep 2025 13:57:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aqj-00000005RWU-2jfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 13:57:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e5980471eso7632465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759240620; x=1759845420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1FGc0c7Pyt79arhBSB2ZwA4aD4/D9YDuG4eKl/UZpA=;
        b=dfPIbHA6gyJK2wN010WIpBIStsqtY1phewCXq0DbTXOyOqXUSzzA/Mcw/lmqtEFXe8
         lT/60d3si+s80VeNGVkdX8lexDB7Kev3MtA0otEo8oyJGwqOvSY5rtNuJCcnyj7u0ZD6
         05fsOPP7cke3EzA30sgrUyHXCaEq1ByWhFtjGipS0GAKCGXsAzh3nndu1ZvXeZCW10tw
         7c2d9AUWUItrG5QMhd1fjHzQmuo1NLw8y9FoPBO6DHEcRRn7lbEbbtbfE/HE5lpry9cJ
         jc5piS3G2W6SPEXoTwVhMrMAoLqmd/ZLOg7mV1fH3xBiDhrU1plNc4l8DruVtU+qPe/E
         Tv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240620; x=1759845420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1FGc0c7Pyt79arhBSB2ZwA4aD4/D9YDuG4eKl/UZpA=;
        b=JGTNK0mVROTHhZvwrY/h6nsgcaR44BaBjl79LxVGfxg0w09kC2jruoEo262crMutxk
         4gKT5bz0SqXJZQibzO3PffIM9pb5HoZoq3gxaIqZyIHOwqyj/AWKxTP95Y1XDaaJA8Rz
         HdJmOpi2X/zN8Ilfp3T3LccmuRExb6xRZOD2MgGUXTJ4Z2eOqFfnzSJw/59HJq+7OKKc
         UMcHK2LWiwyMdwxfNEfg7Wrak4xlNKrjrSlmfvPqnyWEFT21iNbH2lCIiTikoa9/TLBN
         25JyCLVO9vCiT/aI4JznI/QXtPmncRW9GZhE9RfNEGzjQHYllNX6pwPIUGwLM9ArJZqG
         iQzw==
X-Gm-Message-State: AOJu0Yyx9KG4QHtxp03NgQNNDqZvgdECj2lUC1w0P4YpbdOLLEVRJd2g
	WlHVOr+6k40B5ldgM4bqMB8ofgS9uUssz9gOJr/dYx/VAIWiL6Vk3WjO
X-Gm-Gg: ASbGncszGShhJoVKXNjpTIg7Ypg9O7NkXi2prjeDA9vhCFA0aHCVEd3Bo04afDix9cY
	1Dj2HpyDelLPxwfRq7mnsOxEaH7q2Ci5VwL/0aptBp/rIwWKdDtrFo7YR9blQwYfTKVuv0/t0nY
	zWysQBi15vQm++hlrH/OGzKlakGaYMT7cy3Pk+qmU6oJ1NXY7Xt+GuI6jN0tlipy+5stCZatvOK
	mA27ylR4/mcRDLP/5hKPZOUfgloK7jL5SBlrRXHbSXGWixS8nRAq3IrMHzjWz1/t5B+i9J/YG69
	I9Rb74TBOz09WgXpR9Ietku1tj2rlg+FHXPZJo6dvW6/hsTVnAWhULPKqBxiS42mgZkNodfLUGb
	QyUatmJPuxobVm6+bEo2FxnNwwhG81/tFgSCHtZFk0hobRMvlHVRRY4H66jWNgVnPp8U0wEF/H5
	gIILJqdCZpe0AoN5PnR/FaAc86xA==
X-Google-Smtp-Source: AGHT+IEl0eV+Oe9fa7cMgeQckQ/Gji3bBkOIXAKMi+nEieK0u/LUPG6fuatnTc3ieztZ20R+dNzEuw==
X-Received: by 2002:a05:600c:4743:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-46e33b2ca06mr166142075e9.32.1759240619373;
        Tue, 30 Sep 2025 06:56:59 -0700 (PDT)
Received: from osama.. ([41.238.33.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-41f0c467ecasm10062839f8f.38.2025.09.30.06.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:56:58 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] KVM: arm64: Remove unreachable break after return
Date: Tue, 30 Sep 2025 16:56:21 +0300
Message-ID: <20250930135621.162050-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_065701_701351_BDB2C9BB 
X-CRM114-Status: UNSURE (   9.63  )
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

Remove an unnecessary 'break' statement that follows a 'return'
in arch/arm64/kvm/at.c. The break is unreachable.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kvm/at.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index d71ca4ddc9d1..b04c00f95944 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -43,7 +43,6 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
 	case OP_AT_S1E2W:
 	case OP_AT_S1E2A:
 		return vcpu_el2_e2h_is_set(vcpu) ? TR_EL20 : TR_EL2;
-		break;
 	default:
 		return (vcpu_el2_e2h_is_set(vcpu) &&
 			vcpu_el2_tge_is_set(vcpu)) ? TR_EL20 : TR_EL10;
-- 
2.43.0


