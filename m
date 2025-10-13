Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6C2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=; b=RL8waU3rJ2V15IPwIpE7kyQLUd
	C8egTVZUeq2JtNmVFgPqtuvUkG/UFjnKhSS5aXArwyWC1cfktA65Em411jeV6TDaHhL6PCWNRj99c
	LMnDsDap6E5IklJC9eW1mqM2+b+BCWrsrQq4i+Z5PJqwh5TG02MA+K6L9BlUPJ0tx+jvV5MretgkK
	iMoiQzkttrvDYOoIp2pMq6vrsZb4jZMmIdUsoqZ052Hhxf0yDEsHfxYZrB58+2dRC0pg3nPlMvrL1
	R2S+7YUlvExFehTybBwgJhEFKq3e+FjyJ6gp3UVVUWPeErqeH/POKwBbIkHONDgnLnuhujA8KCKuC
	BbIg3Uyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wq-0000000C0mW-2s06;
	Mon, 13 Oct 2025 01:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wo-0000000C0lZ-2eEk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=; b=hLDQia7ViJvzPSjfc40NP2mvKX
	BYRX7648rOMayUOgeyK2wBLXG/9h3iFfV2SYTV7ZrqAe6dRss6OWu7dhWgb6RvQkqqlRkj9etxq9l
	AXEK+7JFkFNlrSjn7/abD83bn0YlX83RN5GRnCwUG2dWaB0cB4lyow8LY71YCkgaEqhkUemfUkvfw
	4hZzC8WD7AVmZVhJacmEn4k8M32XYFW5AVDpsCZMGIWggYNUG9rMjltCnvHb52pZ8VwGW6kjFXxDp
	IA13mYChkObBVaMQ/6AWqcoO4T+cN2MOABCZbKL9Z7o6s3/CQd41fHtz8m4JJg+/sCN+H3nzmiLqw
	oUkIhGxg==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wd-00000003yCU-0i6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:01:55 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso250764a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317304; x=1760922104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=lMZ5gTfTEyUflPz0p1U/Mlz1jwsDXeRhc6TiRYUMkSykP9g/qjilPS5UQgd4YP7ivk
         hmYr/cIXHlxsPFCfVNFntbmzv7bNRedoGIAh6v9Ll3W1N9qLefujEiyotr1dgSSikGpl
         P4w1xWqVMaGZIUBFAvzGCY0/YiEnxomQH+aB807dV9MtcS1FBcRwS3Bj+Tmx9G0z0q+r
         m1UdPwVPCANf+w7L4Xof0Pp5lDxBQR6ZqWt/fa+vA6oW6pjze6c1ExBk5gpNEwzpzHHL
         SOzTfx6KnrfYurT1E42VHOWu2RbD6QM8jtEnpB0mEWhNX9WP/rV4TGZzp0zOi0M+CKoz
         Xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317304; x=1760922104;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=kCG9iqf49QZtpt/o3ELXibxF9LDM3gXo8uXhVpNrApNZhHks+fiaB5mfGMyenkPzQE
         8KXFw+5n3cQMYn1GwS9oje0cB3Z1S600nlOtqYUUvsfrvvnh1Okg5Ow2y3FxP++aJbdG
         YnB4wEsOMqWwYzlV/81gKxCWrhvdG8yI4TZdJZZIjOYULQbPNyuPIBBVlKrh69Bf0BeI
         xeRpk2nc8KM+7Wu55EuYntdcQW9RhSPZDvJ39WDkRz2iS+QBUdUADO8Rve5GY9oRfMkd
         FCb5rKD6BMVOuCXVPdUjJXOdTqgPEzGaJRyyUdpEjbOE5k4cAZ4YX5DIpVUOQyf999PQ
         84DA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Nhsuq/phUpw5eb2C/wZw2fNhLG7DdkI6kVw0+mHlGP2PTkGoGUtHhQ0dMmeET7fil8TXM7Ed1Cd0Au37NXjV@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKCx3gxFAOlTVRMKCLKQfZI5ebqBxAGC2nDwtmKn+//S5nOEg
	XxuTsXEnO/cUgZRbKu77xeoV9cslsDKTl3wsly5u2yXNQhoRSXRVDi0BYLDXQJQcB/hFFZ8GU7y
	XlxduxLk=
X-Gm-Gg: ASbGncu/KkG0XLgm+szn9PgsZ1Y4bZPUAzBBkPJ41N8Y7poKmqOXocJgSWdOdn/gbxP
	ird8bcrZhE48qGnLcR/3wIQGN+g7NlzVEM7whfnN322BZAClNvBIUtW2oH2tMCsPvrzsIf6kK4B
	1NRdZAunGirF89fvCErCgY8y2W2nj0EnIC7sCQMc6lJ9gBIT1x9Axm337iCgkvGvwqdzoQ0fRfO
	QhsvfeLXiTQiZRBNeZ3N7M512RVTMeiYbnxX8YlYrexmVIttYq+S6qDztzxUi9PHDiY6A1KhSIj
	0precAQ/KRKTAdYar9enR1wc3Vs6PEbhV43lXmlQcSAqSlYQt3xVl7jv99pRK+nTs01D5d3gBZI
	/CU7i1pn0HxV4In4ytf4KXJtbT4zqRXycvpCilRtHg1NydWvr9M1sCNhfuFDO
X-Google-Smtp-Source: AGHT+IHGK6ykX0spOQKYWsRpuS2oCY34wte5d1qjAZUxv5DNXPyTnvUCU5Jclrwq6RaUGeZTRY3rkQ==
X-Received: by 2002:a05:6a00:cd1:b0:776:165d:e0df with SMTP id d2e1a72fcca58-793827947fdmr11943201b3a.0.1760317303940;
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-3-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
 <20250915095401.3699849-3-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: exynosautov920: add
 clock support
Message-Id: <176031729821.32330.18319569352723802430.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020150_268650_7933AB4F 
X-CRM114-Status: UNSURE (   7.12  )
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


On Mon, 15 Sep 2025 15:24:00 +0530, Raghav Sharma wrote:
> Add support for CMU_M2M which provides clocks to M2M block, and
> register the required compatible and cmu_info for the same.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add clock support
      https://git.kernel.org/krzk/linux/c/ac5d829873c737edae220ee654e423d383163630

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


