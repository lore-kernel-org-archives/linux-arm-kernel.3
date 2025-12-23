Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43383E6F091
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pS8rWyfWcotXxtGYAT3bEx8x0gwT5wDTFZwn1Rzc4PE=; b=UJk2heAn0nKLBkBbXv4/b365rN
	fWBisTnDHJqXA16T/bjnPmzV4+5ePuaiEgkYTLTLwx7YE4O/VluCNP/mtySp3OiemcB/ZxczzC3T4
	qycsEEsle/Jt3KFV6fwjwtYhMDvxIRtED77uthQsL1IT2J66BpYnvhcL6APggY6u6LMPP7YuGukIo
	gf05ndZ4/xDFMpR3jH7cUXZujctsoiGJ6i7hzRdXoZeLihhg8/eaj6zVUm+ku1w6LUFLdrXdMhoEr
	YtFmS7YrzTYo1aC8tIyQruaPnm4ozYhXpPxOuEWlNjHTDyPwrv9jrYy2mSwz3KyIY/nHFrnqfmu63
	fx27PGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2ka-0000000FYKi-3nRc;
	Tue, 23 Dec 2025 13:48:32 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2kY-0000000FYJq-1oU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 13:48:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-598f81d090cso5388585e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766497708; x=1767102508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pS8rWyfWcotXxtGYAT3bEx8x0gwT5wDTFZwn1Rzc4PE=;
        b=UApxQnZ4gSbVhDBq+OomzrZ34bwTE2fJjUU2RlSspGfd1iDiFcItSpDhn4OhFO3M9x
         FyX8qxEopdb9CcyLNCpSdwJb5eC6CSN0jZdry6yKQ+toIq/blMFAU2TuSurF3FNNm10a
         8+V/R27EDa4hvI/HWD3tQag8PwXZfOXuBEp2pe2uLur72Fl1VP41R8/nGFM0JrEuBfoo
         lO5u17/oGuc/HmTLTtN8ETyVQoUeBwJqa3l3fn3MMwpvVABNFaGbktjj3/RWX+k3V8fH
         nCcDB4ZdsN9gjd20Bh1lixcm9jAHsa8pOg1wvPBPlcNXudKRwFUT04J/dROOUk2gYY1f
         I4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497708; x=1767102508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS8rWyfWcotXxtGYAT3bEx8x0gwT5wDTFZwn1Rzc4PE=;
        b=TFzzgvNxF6rL5dBL1/4rmzXGydkVBUq3uXkIFiF0PBkuhYWh74Y2lA52l7pGWWOmHd
         aYHNe+e94/z2Dd4OrTAVv5QUWCen5I+lpz9cumpqcNRa3JnqvNc6q4NhVlsj3rugjz7N
         W3Hie99xKrMCCu7B8396RZ6DAF5OIdBhDo8eiF8sSmomwQOmAtOLJQJVb5ctx3uS8K9m
         vJ6Xs8mOpCqyahiOGIGU88GztRZxl+59fl65XESaYYLpGefKrjx+4w/NZUMulIeS2K7T
         VrWp9X4h2Sdvpt9stp3MzIpUciIIntpwcUEAdY4tLYtK0A2cTZJY46rc/7+tF3B6z1Z8
         RSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVmUOre7GATfu5QdNlmnu5VCk325QKcQ2AWUNu0PwwmtvrWYAgug2itbNPYefuYyMorg2I04b25VVslRe1iPel9@lists.infradead.org
X-Gm-Message-State: AOJu0YxxN4CCguCBOK1s/3U1S6FdtFqMfteMmAhTIuT82Xl1/timXgwh
	DeMN5UgvIeZJ5UUgAiDPPpitkOhidBsFf5T+FqeGF9msEOGjec0OArARWnLqIIs8psE=
X-Gm-Gg: AY/fxX6zqGveCnIhGxrBIiwrPr5tYJN7M9lJoTZuSpmvnUGBVQXJTceVkAjMND9MSq3
	rgicc4c/5nCKJ9t3koAEgc/gubAcKs3hmnaSvUBYb1G7Z3PxjStUJyvsgpe8PnrmQPm1vklLkLv
	fJPuIOnmD3vrWEJ3UR6r8K3jKYvSPO5kXUzjTw/ukNq9Hd+yhK4lR8L/h41zJctuJJTPgNzwehc
	pEfjO0nTIxXQG5Lqcu3BQtOqYU6AeVmrYNeQmNPKkbyH6ZSoycsEW8fsEJmhfvRUGe/lhYBicy7
	j/AlhtdpCcFHlQqva6KCygNmSge9eg4mb4iEl+LytaCE7AkcUXOlUFLCwwnGlck6xEeXkfG1zC7
	6GtAoLQ+EiiU+zIPG0M1LDiqk2FlNY1RaDvVov4q7YBinPX6ZOJzctY3WzYiDDT1/1gIizV+Xy9
	0JtjrJNg2LwKdxsFjPJ2No8FKOrv7KXFG018QKydUNI6NFd/rG7Y0gYIo=
X-Google-Smtp-Source: AGHT+IG+c4/RhrcEWvVjCw+XNfIQ6jiup8GUv8VhayqjYvwY9lpy/eTomyv1J1vV47F+EQ3wMHzWlg==
X-Received: by 2002:a05:6512:1307:b0:598:853e:d3d6 with SMTP id 2adb3069b0e04-59a17d66996mr4927844e87.51.1766497707712;
        Tue, 23 Dec 2025 05:48:27 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm4121821e87.69.2025.12.23.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 05:48:27 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] arm64: defconfig: remove SLIM_QCOM_CTRL
Date: Tue, 23 Dec 2025 15:48:07 +0200
Message-ID: <20251223134807.3543642-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_054830_489245_BFDBB450 
X-CRM114-Status: UNSURE (   9.15  )
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

It has been removed by:

Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 997fa7cd9de5..4dc0caa36263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1709,7 +1709,6 @@ CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
 CONFIG_MUX_MMIO=y
 CONFIG_SLIMBUS=m
-CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_IMX=y
-- 
2.34.1


