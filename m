Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=; b=Q9fkxfIra821OjPmPaBX6/GOYV
	yo1gZnt8j/F3BSNNnheqHECdj4qSx9S96y/siDw2OEznqwjhmgPqcfqCQ5bmyNtmbq4105skQwXTe
	+WRZXtREW9YyCIZIfrkrXifGku9VvNRgzteqoh98M17tmlymyaamJGAo60yF2itEuhynTDWaQdtko
	zyYTkIqp8o8dHLr5ozaj0sZnkXzUeCH/Do5UKrpdcLIHzE7l6Fv7tupChpY/TiJPHLmp0B4fQRFkR
	ZXtVu3/yg545ZanOFhuKE2aiy99WaHvoWhpr51h2DTmW5BMJSzGiMxWKa6Kbdlks8ly++L18846Fs
	Lx5cTLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEiU-0000000Eb25-2aHD;
	Fri, 25 Sep 2026 22:48:30 +0000
Received: from mail-oo2-x29.google.com ([2607:f8b0:4864:31::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEiR-0000000Eb0x-1d7S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 22:48:29 +0000
Received: by mail-oo2-x29.google.com with SMTP id 46e09a7af769-8137b129131so932698a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790376505; x=1790981305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=ARgTSFJxjxihnjd/VcQ20OlaCFRqrkHs5Paw1zEmk8BVpgrZtRjuN63qImMnduRFTu
         mHHSB2A8VJ8n15g0HdQuYc80bOQfflTJFxoE7nkgokGKGkqd/wsHlQAoGs9OqYqkaNbq
         1zcJpPRueBtMFw3z9YO3hWzIEsZ9QaW8JOlwGnkgo93pkkwIHRtwo8LMX7RTnE029E3E
         fo0iEcT8beS6u6lxSfCt3YGG+5JMtW6b3o2jCdOBECl2EZd8BznlAPV93VyhRcfP98fy
         LMnailcQC8xcZnfLc6NEi5Zzqo5M3PE2pKYkgm23KjfwvmvQCa/SZqdDyqgf7bx3s13R
         jYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376505; x=1790981305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=dbzu+vwHSRQJTjU8jAqRnow8nKdecodUA6i9BJQjTB8Bms4/gpVN+Io+yerhtKxaZa
         fBYFsrPjiT1EWS9PM6hDClh2adgadXaQgCFhybSG03apF6G7vbl7XgJ29rZ6RZWPsKF6
         s1IhlSSDf1Xc46EaDupXkND3XNRH6cegGf0yW0YyTnyJEKgFm/VBxuZG5hqrBnOkwrZJ
         w/+VwcHoM1XLWJvaysyp9UiRk2uw94rnUAISstiGIDtc+OahHi7LUFU0W7glPGHIVXtj
         XLrn32XNt94AW3IfWtXPPbfHm6zyXGdbho3W7W70l1ZUL0NYXJVJpNNlEbKo5ZNq4Vsi
         UPgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTURfqqDTnf0dQGhLLPPzdnmTUaaYrHQbgN7uTqyoQe2S8BckuO2Iuoo6RLjORa9Af7yRCj5I8gIVmN+VLIrK6@lists.infradead.org
X-Gm-Message-State: AFuF++kdVWRFcJoPaqDxxkVWkmMeQ43lhStfblvr8XcB7aLPq/a+p+FV
	zvcD1/RIIQVWQnd9NAJq2yt6McQ2UTVIR34Naeuz8eo7xk6PwIWvsZi+Sw+Ty22nZA==
X-Gm-Gg: AYBFou1mr9FpWkzo7t+hqOov/i8qOkTJNgWlXtsITHFI4T5gBGm7CZfiRvz3KqPddac
	SZ3Vs2Pp9Yhtp5fne2+oJGnxfCQstGuPxwxyqiqSPaRSLW45RK/5FT7gmBzWzKMUi+zemhl5m9E
	r/Da9GFSD6mxRohnMKrfl0mAhkuva1LH6FaoxEjWFzSN8bSi0d3rshgkxDtmg5BU/clH5+8errm
	z2h4UFJUCkc8qYjj6bAdc8ntSTAgtwcAfNj6Jv2C6V4ZVng4SG2QcUij0gvepX9xegvZ8O3RNMQ
	CguabvSkmIuZPu2rwNNa3lyaN60gJvAVqGPFWzkvDqlaGtOOuTpdv4zmk6WoOBW9W+6iYtNoSVD
	YH1vrRChaVbSlGuXR9xhTmREveUoSCp4ex6SuJlM0lW5+OqcU2PsoKJPnYBMpLf8drEuzHsv/0l
	q0ntR8AG8MSsrU/YoyMA13sM01BvMwwGD4cgxQ334ea/8si/4Wg0N9F+xe24NTWklIROP/KBa32
	L+jsG9OARuyvdiDwwK8JtQY0GOmp6tJ/65J0qDauDAdxAQ=
X-Received: by 2002:a05:6830:4425:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-8178168df1dmr7919471a34.13.1790376504752;
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Received: from google.com (222.97.173.34.bc.googleusercontent.com. [34.173.97.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-819471d2bdbsm2561506a34.13.2026.09.25.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:48:22 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <arb6Nn1Yy5_1u00w@google.com>
References: <20260925222959.3607769-2-rdbabiera@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_154827_429674_9FC4F2E1 
X-CRM114-Status: UNSURE (   7.03  )
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

Thanks for the clarification on v7!

Reviewed-by: Neill Kapron <nkapron@google.com>

