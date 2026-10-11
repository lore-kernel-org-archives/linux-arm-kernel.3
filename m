Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FACCA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=; b=gPEweGnN4gVz2kse+gZTvKU2l2
	qccn1lAzoCz1LTHAMpXlktXDqnwDRz2aeVxUd+qCPd2K1I4C/7zLSBw8vNDc9mtasy0JU2srzKbTY
	8zl2XT8e1iJtWTdrd7km9tsSn3QeK7FIErSgEFBPjDKyHFEz5iSh6UtUGazUEPNrCAbJf1pomDCGX
	p354/U9Uqp8CLER3Ix6NwwEDlnY/N0ZKgtIPYjV8ktFc6llQpV0L8NKYBaNXCN99mYKL7OgITTbbv
	u5wCAcbY2eLJiRU0N5aBGNfOQBaqHPnVFoeBvH8loCkoODm+LRe3eOsfq29MVbYiShwy0msxXmsNS
	WY7fbI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFh8q-00000008ZF2-0Sx4;
	Sun, 11 Oct 2026 00:10:16 +0000
Received: from mail-qk2-x0a.google.com ([2607:f8b0:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFh8n-00000008ZEF-04wW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:10:15 +0000
Received: by mail-qk2-x0a.google.com with SMTP id af79cd13be357-930f59d1dc6so58750585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677412; x=1792282212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=Iwbg0b9hbH5V1+jfApsw59osbDkAL/vHa1H4Z8Tx0dTQV7ZiSAtaD6SBpWRG0Phi7C
         oEMvDRg0MwLcMSfstPziqP3aUfWyfFF3dHqTTtQaiUR5ECddmWkjwINsWASDq5SjfkpR
         slGJEV6chOAUNnZSn/V8I9GNZ9gMrc8AYcyDmSv1NwFr09mCqhwTzcmym5jsiOsvQZsz
         3nDBR94ZA4HqBLopmc00qQ+4f8haA73FBtwXZQmgVfRhEZK1MSfFlRK0onya7ZUnxNrl
         LU4aVN687UO6C5GU/mo0qw4qC8i1e/vuKmosqjXhOVkiJQZseXzPQ8nWbxI3QPUSUSGb
         +1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677412; x=1792282212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=j2r8EiWyM/bIaFNMcJ9HmPHm9bsGCSkDAyCK4S7gjzXl6E4viosS31zKsM4bsnWK6K
         1hMHnH533smdcECSLyp1e2MRVrPSuTd7U3ae4/wjypS21oymQCZZU/QBGDFaw7K3f6az
         FuS9N6KVHdhTB0eDtTLtGMnX57j14iHx1pGdUz4zkSvQHdrSshaLEE60zxWY9I2ODnIZ
         qftl+5hXyGUtRTaXIZImXVl1rFa6v4DDp/qQKSgnB3frM5pcdZ6N4GOFabQ5Xcz9BxCZ
         tqJFJGc3CntQMSEg/SMkGRMT/BuINqfAv6+B52iOp/x1sNtc2FuSyZgfvIJLzenV3dEA
         fy8A==
X-Forwarded-Encrypted: i=1; AKwUvBwFvHbhIIFvw4bxxtpTiMWy0KjmN+fyg8l6O5KhT79nuzUJf24plQY1ulVpaBXRGJVn+yH36IARULnmkV3YWglK@lists.infradead.org
X-Gm-Message-State: AFq9FYKYb4t9CwjE+0ZZbkrj21CnWZ+G8SF+6KXucuA/Fa/1UN4oSZ1l
	+2BFSFBFAGA0JUSZtEm5/fuKsyTDa1VGLvWZxhdYRswgBt62N7lLbttC
X-Gm-Gg: AYBFou1s3CtNztDt5CDkTv0fIFX8Qnrb2xEQvVTEzkTxLMgjwmIqacp2LEo/1peDOWI
	GoynKhb8WyMiinJ/ecRY4Rj9BstI+Cl+XD3mRy3ccrfi4+oQrny2WSwR3SGRZVdMgKd9qmpuBlE
	hAKz21Ivy16L8hYup8ymgtebXaUT8Vzvgsy2uHj9BmzyeB0yMCs0A9pQfy3dIvJhh3lhvAccm6E
	CYgLM5qvVhWm/pX/5Df3QxD0cZ6CqTHfYqS7ZiZRMCxutaRqv3JWr2O8IgaDgLm5eCRoFC4WjSk
	PrmJMMSFizOky4Ibdn6kwYZn/pBQCO7pULV+YfG7Qx6nUuDchhaSys1ShgL+2Tb6Bp5vaNFPg8O
	+nTs+tTa/9D2o2Me5T2GtM6IZTKA+OWEkF2idXOOnlPSWIOSL9cy5srDwxUg5LSx6+0oQFpNXgb
	We/0UimJ5b+h15NyS2kfPXw9dFwWgZJP9OPRBRNs7tDEiiRNwcCVtD8N9ingFGlpGwFjk=
X-Received: by 2002:a05:620a:4692:b0:93e:95ce:539c with SMTP id af79cd13be357-93ebd0e4018mr1010764985a.2.1791677411682;
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98ff9d8sm523933585a.44.2026.10.10.17.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: add Genio 720-EVK board
Date: Sat, 10 Oct 2026 20:09:22 -0400
Message-ID: <20261011000922.1089313-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_171013_088301_47AB9D71 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Louis-Alexis,

A note from using this series' mt8189.dtsi as the base for an MT8189
Chromebook (Lenovo IdeaPad Slim 3 Chromebook, board "quigon" of the
skywalker family) on next-20261008.

The dtsi has only the cpu_off_l/cpu_off_b idle states (PSCI
CPU_SUSPEND 0x00010000). This firmware has no PSCI SYSTEM_SUSPEND, so
suspend is s2idle, and with those states the SoC never really sleeps:
the EC doesn't see the sleep signal and the RTC alarm doesn't wake it.
ChromeOS's mt8189.dtsi adds a system-level state that only s2idle uses
(infinite min-residency); when the last CPU enters it, TF-A and the SPM
put the SoC to sleep:

	cpu_s2idle: cpu-s2idle {
		compatible = "arm,idle-state";
		arm,psci-suspend-param = <0x020180ff>;
		local-timer-stop;
		entry-latency-us = <10000>;
		exit-latency-us = <10000>;
		min-residency-us = <0xffffffff>;
	};

with every CPU listing it after its cpu_off state
(cpu-idle-states = <&cpu_off_l &cpu_s2idle>, <&cpu_off_b &cpu_s2idle>
on the big cores). With that, suspend is real SPM sleep on this board:
the EC sees S0->S3->S0, RTC, lid and keyboard wake work, it passes
repeated suspend/resume cycles (20/20, then 10/10 twice), and a
10-minute sleep used about 20 mWh of battery.

I can only speak for the Chromebook firmware, so I don't know whether
the Genio EVKs' TF-A implements this power level, but it may be worth
adding to the SoC dtsi if it does.

The board files are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/mainline/mt8189-quigon-suspend.dtsi).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37

