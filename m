Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DD0C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=; b=WQ7awPnyMvdy782Aq0RbM4peOn
	JpoQHRElQU5WQ7x8z0BGu9APztcTU+T9Y/RcPWfzHOeyRKWkgjSvlTR7T4kTD4pqAurF05X6uw4OF
	e8xjAxQjJkb/vqov7SKYuYgtYdhpMinKik+Cg5lKsuPgoiWnb+fQH1gEEWwFX0z2O+j4dGMSokuPP
	DEE6bvIPyCpIHrfjBB4ZaqoK3Zo2cuy316ukcwsG4giugtrAj2FlEUyQ7skr3p1P2ST91FW673s0U
	aiky939rTRTRuJuY9gUpcLpWNnPjSQl5ZA7la70WpK5IG462pMGEvvoxbtyfq7uWFCs42m+hW2Hq3
	uf+8r/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgsW-00000009ugw-3tI7;
	Wed, 19 Aug 2026 14:02:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgsT-00000009ug5-2xKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:02:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so10661995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787148168; x=1787752968; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=a8sjjfB62rNwI+rnkpG32fqtnsFcWYdZN8fhwGqb9VEqL3QAXfa68asm4oAHbRrCfY
         Plae16YiguFAaYlD5ybFHvjWGCJH6FRpv4MhjPoonIpHnSyw/HDslsQoGRt0ghauKE4b
         3Xmw98gZ6ZccIa3/pAa2uD87M6ZRya/x27GMtZV3D8TRZiP7kves0DDi3jjcNGzeBz0x
         F1CeQ48/mH7pS7vy5mae8F86V8tWUocDP9gpkGsOb9ySTgBEhVfH7Vf+7n9j+LC+JNRO
         x5iH06F2nVcH1VVKrXNaqTv7r+K5xdLJv4cnBYOBiJx+Op1LMXrRxfHZqDcInnD2TFGj
         kMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148168; x=1787752968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=oHvwClqJtIz6gSiojYawCbIJ6ucxc+pqEAWYipcC3dtPR5gPVeKBLaDbb3QUKbyI2I
         ro7Yz5vdiehAq2QZaA5GhUGmIqkA5GV0TybBFSO5ePFHwE4pK2U3UjAbnalIUa6zcxkG
         bwhD+Wyy7YZ4VQZ0Ym7a36lVIhfslyUekGeBe+CKJWcncITd7UW8fmrvsLbNoBge2Kr7
         0J8k61OosYahJwsEikaJrAaV3y1R1+261WO2MKsyjKitehNdnx+M333L5FzMeIoBok9P
         nHTI/0a7UK9sA3o3/77L4K39UL14EXcOoODCQjXT9aVltozORqEicOTBG2xOersJzX56
         fjNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqL3rcTNWRhlGV7nyIQ75EWL80cQ0rUzYNOfXgx9+OfSgsOtRmliLXFef//WYe0xywyOn6ge/A1z5jO9QJyi1XR@lists.infradead.org
X-Gm-Message-State: AOJu0YxUQ5q2vQVjWOs09HEAduyeSMzOsmYSZI1D5zez9BjOAaCkRMCf
	b53znvQJaP0MmdmI+FV7ZVaw/2x4hAk4wDwVkkSLBbuozpp+A0aaeOvhOwUVCBDzeNo=
X-Gm-Gg: AR+sD10J2V9JXRTxbSOGM2w/ZFwMwW9UIKxIHGBDiRAxFLa/p6gqPmN8kyJLKEycghy
	8CVzHFaK1SYG39prx/2BcXkMoJINP4FNmsYvjcUqT+GtSpRe8JZodatWIboouNMHv74iLLxA6kw
	7ghkeAP3cVwMGFSeLeZHo98nIsnk30MUeAhtl80u9lYnZRbSbfcPBdJRzJqQ6LN4w7cm/k9YewQ
	RhnbNjMmeQSLflXf4O3hUopCXI6zKVfWIcV4TzL+kMm8b+BaYC8NvROGkBIDW0xRFK+tpvxV1Zp
	YhWn4Mt3jjpYu44mXEJRS0qw2sMqZaxZPONBMJW3NU9M8buZQLMAj20PonjDVJbJ+iFmsWm4jMp
	PX4zKV7U1Kf21XvlL4J3NmSp2Gyk9FDI+lYLIxPavBZD2fqS1Y4ToRorxneKb6y9Ks3OJ2OWrP4
	FqbJ0Y4yJWFsptt4WPzNdUtSHG0i60d706LO1AsjCF/rirWeOvivkmkTT2GIDwHRIXugNRUHg2E
	EFuEvA=
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr77553585e9.7.1787148167637;
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:445:d261:4474:9672:b73d:5481])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm65896975e9.6.2026.08.19.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, mfd@lists.linux.dev, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com
In-Reply-To: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
Date: Wed, 19 Aug 2026 16:02:33 +0200
Message-Id: <178714815309.32179.8598674853319251320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787148161; l=396;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=dlXJOH7EU0a51dAApmdxSA9IP84RNY0Lan2Iu+swRps=;
 b=c/KerOBtBLlU7G268kqzunbiL/W9hE013JTk3ATgEU/VaHaT/LXB+PpH0Ob3QlfkpPx+mFF/z
 EYquBWAhiQTBMj721ke3wRMepR8gy9yQ4WznJiFfSG2PvjnXP2qnlLi
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070249_762926_825F2D27 
X-CRM114-Status: GOOD (  10.03  )
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

Hi,

On 8/18/26 12:29 PM, Grégoire Layet wrote:
> The VUART 3 and 4 are VUART over PCI.
> Set this flag to indicate this information.
> Also set the scu-syscon phandle.
> 
> Added lines are compliant with dt-style strict mode

nit: no need to add this explanation about dt-style strict mode.

Other than that, changes are fine.

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

