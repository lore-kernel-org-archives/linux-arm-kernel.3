Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53663CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPDy11iZA0Q8NDHlpUzt6W+Urif82gaVsEWWDj6nyqs=; b=LTqZK0kAQLYMwMQeqMVmZvFUvK
	WGCx49TKQ+SfWVt7OvY2jFX2ckFKBnaZYtStmze4PaLCTiP5wcvO2ENWdZC/lLep4UYB99klkK5/f
	lu7l/zFatTlzFMme/9XXVd8rBejUsT/oquHZ6Hj09Yrzt+GGdV72tPxoayza02x/7o3eCD0Krn+Fd
	FEmJ2KOUxUf1p5mhvue8SfdTyhOzb+ibtbASsbBt5c4oLrtj5csFudrTE0VZ5uFE8cDpvTMJQ3ac4
	xXYoeKhIQqsgSWPo1r9u54XeiNtQNQuDH2AnXBGVO4B13vYgi3YWykFg/uH+6/EfumcRkir9mWk8q
	EYdY2BRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zw3-00000008wz1-2boM;
	Mon, 22 Sep 2025 06:22:03 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvo-00000008wn1-3Goz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so936475e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522107; x=1759126907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPDy11iZA0Q8NDHlpUzt6W+Urif82gaVsEWWDj6nyqs=;
        b=iu1qUAi0nrRced/3Y4VFlKBXplZFJvj/EkKmn6W/CIUYo9Dr4SkxYQgitVXDYYfTYl
         yePNOj6YOT7dnK4Yf1yQFjYVcUDpH7xfvJ3BJxNw+L5bjRcyp0pedXot8TrXnsni0c0Q
         4tCaNC+Pd5qFfg3PSAa+KotNQVoRR301hGtIVV50FA+nZsfUuJk41vVznDpjSCi+e8bJ
         F1wu//+H3sqLf1YfxAWdOCbfJTnQom36SE1ymNxxWYemVMQJ67XA8B4LWaWEbCTw750H
         sWI6Lx9Li7rbpFwwpX1GXbeKP1oVoPOfBwUTAutXK4bpldPKd30VpAhvG1oxeVhr1Wjl
         +Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522107; x=1759126907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPDy11iZA0Q8NDHlpUzt6W+Urif82gaVsEWWDj6nyqs=;
        b=HLqiyfHvEJ1kzvrbfR/7pk/ysn51HsBG6jfr7xtWwcsN980LFSSEfTGIip3UzU5kHt
         QlHqf13GEFg1YrWXnKR+L0suTw2uHh1cgDBN1UwRaQYAy4oFIEwCKFdzI00iKa992+2G
         n+/gW0NJlPImQgzmyiQN8S44uf9yeu6lOqedf9/MxTgCIDDphJIddMOcndOGUKoI5l0c
         zeiX0i1zkTZ8Jxbrl7qePrrjBbHyPtLVg3Rwgs4R7W4pnhHTRbFKFaKxCzug9mi8f7Rr
         +nr8P2Suu80a7SOU50FNxIW+lEy4DFAYsPIWgQA8ZkDdHXvPMqynsveefCiO+l7+g9Bq
         64BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEWRyWU6f7tA87g4YM5AW/kDc0NJCdmmpZu3HLU2mpBWrCMDx4bzwkjZ9rTMonXXeqA9ThMikNMcIkA2ECrr8c@lists.infradead.org
X-Gm-Message-State: AOJu0YyzYyXMxcbntd2E9/GlPO8hrO2Nghz+rNGRnX2u6EMBpED0IEAN
	MWlT9jkhfH1AwTI8Eoi15zVQAnICUL05h3lbODlHW4wp+aMKSeCeZxcJ
X-Gm-Gg: ASbGncuMd+Cffx81OP2GEoCGa1ERjXD3ZZ/mD0ZfEsi9rEW3wRE91JQ6QuKk71tkt+H
	elsryiegRcCplm/bdYlQ20T1peU31zbQW37Ascm5vpQaDs0JywT0uzyO5KQERWT9A/TqhSqyghb
	VPgocBi7U95290elYqspnVaLGRtYu1agoMy7T0tnsM8mS3QmjFJsmZ/enLZ6r1IlV/cPH0C4RKE
	30bT52j5TORmGtcIW0VznyLbFajAdHcYd9LbS2a4/Qu8VcDa2G2KrHg5Ut5Xlmy+DzqUO3Lc1GB
	hHckVQYodZTkVhFAAsHahJEt1DMM4EvYjlQ5prw2KLsBKx91IBD7BtzMv1TOuOoraWvYMMog2rX
	4u82RrrDPYjdalO93o7p5QmD8lmCPQgh3F6nucP6l55KMJphlGknKTBNsnGZXcIjWyhs=
X-Google-Smtp-Source: AGHT+IFS45DD9XX/3MhSRL0Rz2agdiKzl2VuRLu6YIEhM38xGVxDCvEjcoPUZDKKGLI+hWITdR8c4w==
X-Received: by 2002:ac2:4bcb:0:b0:55b:8273:5190 with SMTP id 2adb3069b0e04-579e1d56197mr5217562e87.18.1758522106585;
        Sun, 21 Sep 2025 23:21:46 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:45 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:59 +0200
Subject: [PATCH RFC 4/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-4-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vT3u8z9JcPm3Zs8qxToNt2XUMMG8ua9os0KJiBxmsh8=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0Ordh5iitf7lhHDQuSZr1/thsDJsbdWjg0XOg
 w5s41jghYeJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq3QAKCRCIgE5vWV1S
 Mr4lD/9vC0aI7ksGmf/RIn+tZapTkPe+1EzpkMWshsqYVRseYTMjwPNSWhNoadhZpl4uv1XkhRK
 jfx90FCx+DXpNmTq3H7JLiKXnfeND1ZXP6cv95bzahIeY8ROtyD4KeM0nv3Eg4NHuqTum6qa2op
 G1pI0RXDimCosrtTHf9DQfbCNzh+V8UHjwqOuA5Gm2Sp0GomcF81p1g7QVz+NGxrK7xcXzU6GL6
 x6xw0KL7K21jspYgtQQh8G+ux7qNoOTNDXpfcMP31ELwrzGufFJ9+dZ5efLA2Ounoi9FgXZriRH
 UpqS5twxNLEsgDXH6u8of49OpszwtePa+eeyt07v2iSNXcGniBFH2G3gWNVMVKfm5wUxyFAcSxG
 I+0tS/pDv/4Fi7inJjodbf+LhaTNDeE4SgB6Cj2PnsHoe/we0sNDXlAOVATU3dQTR/9qvMFn4Tz
 LWoTwEAhLhk/TU5dFL4Jwq2K7fotTPfk4luf/kdVbM508nUhhNk8Jd5nHYIonroOf8+7KyCKGiu
 puAoOpKJ2I5lp96pzH1oaYo6I4ZjzYFRMrYMy2DBEnhCibitR3H+WNFy0e/aqUTn5HWY2MCneOP
 //RzjrAVI7AfGJ6X5aYGzA2nh2hyAbFoYOXsa880k5YPzvJUjskNlHR9/oVNNS9UfLnpMhKw03V
 ybfzSp8q1qX5Zwg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232148_851463_B2411F4F 
X-CRM114-Status: GOOD (  10.54  )
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

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 50fbc0d06e62b2743dd7f20c9863d56009dcf0e9..4e81002e2e4d6c63f13cf44e16581aff836f7d4f 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, MUX_IDLE_DISCONNECT);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.50.1


