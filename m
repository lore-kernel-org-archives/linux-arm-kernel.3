Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32361E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MDhAGexGxj9ILO+hAO6dd/OKAIC/9t4T9EMrSgxzeQ=; b=vS5I8/tbZxKDoSsyVaJVBw70k6
	HIRfR2j4lCPydv2g0p208oMnAX7Yyv3hbqgq4zoGCvew2HSffk4AptrVDJ1MlQVTkN4yZ98Y8hUNs
	2tyd4m7lkc5faa82T3V+aGdSSBJHnmvUvrg20zNb9VRN19fy9psrr/rQFRni8xL++8pTX7nfDz2fJ
	Wn7A4MTzp4RiwxYxPKFDwXhc8yjHpYo8v5Vsjb2UM0nCa2Wau2tfQhT2/K00lK0ZsaoOsxG0+SemY
	5GgaxXytfXdFT9/s0ZDhHuhvVfg/W7TzZIGPBX/A2ZFVhzHhJlUFxc18HUMyd8/YwpuATreKy7Kk1
	AJaIKJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvnt-0000000GzQq-1R1U;
	Wed, 18 Dec 2024 15:17:37 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvmf-0000000Gz8A-30Fu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:16:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-728e1799d95so7763800b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534980; x=1735139780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MDhAGexGxj9ILO+hAO6dd/OKAIC/9t4T9EMrSgxzeQ=;
        b=mPzXrM6dc4IW9aO70R8oeXemfX5PRVaEm9PteNnc+7EKtPkkB+GvSnKz+v7I1C0cAD
         vpbFg5KC0kISrLhWOc/xIFrkjnLjRR2hP/BtDtUtCm7wMVE//pT2PrDBGvNtS9RcmIta
         G9aVjfSY0TD/v+B+MdXYSIGCF/tSUZEfX/oe06zPz7KvMoAEfftOvGVpIinvj0m1Cosx
         lyB4jUXaRbSkqqGxfY2tLoGOCDzZtQ/phHbRupfdbkThFCXhGSTTj58jEkhUX7jL33eA
         nvA49hDSFYCNaKmViqr3lZe/lrY3lDch8a5sKZt7hmtTSGAjxx1OVk2YJURNSdrJBuzM
         5XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534980; x=1735139780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MDhAGexGxj9ILO+hAO6dd/OKAIC/9t4T9EMrSgxzeQ=;
        b=wqcF9IiWYhYcqeIsOwoibq5OSrB+06sVjIs6ppfggcUW4A9q0EUG2taydzKRY1N3D+
         gpHhpjAF8ZlUl8HEZBV8hIpnRVVbF/xGNKss9r+Q/K5LKSKQX4NQV82HP2s/WP5wAZt5
         49HcTKDFBQ8Us+o8sydjHySpeTFUD6YBiJB1VekVlnx4WfSJV/zaKpEW+2ZjbR8ZqE9N
         68JSl340J3lzW9EBX3mFJuoLbmHyC+qx5mKQCoDZ2LQicXzxnMfsR056YaUrADfXCTbw
         nIW/dA6J+AJALsUwKlnzYRU1p3nuy0SA2UwMmLE2kpwzPG4zuv79KqSIKZHESAOaeiFd
         4bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQuNWELoSSlLCNWh13ey0ePY+T0f5WK0MHzv+QpyhbtCKEMDcuqTq03SJpZmuHlvSTrfx0qpcugfIKtuMwzgyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxaMrWQYTZTHzVaJZ3uRVMyF5mLYApAq4v82N7OfiM7Kjzmd3Sw
	eAD1wY9PV9qbWzNZ347Ax5ZIqe3GchbNlY51kVqjfbD/qTGYcms/
X-Gm-Gg: ASbGncsG9fIpe7aZ2pFgdOTPiqIPbe41lGqbpbA96muD33dJwnsqefCJSyngJOfiY2y
	9RcFzdZGSsEOqPBrurorYSh4BAdPD5H6VjMqARYCUaiAaz5YKTM7jisYlfwb1G8rNwgsm9i5mEk
	FpnSRzIKS9MUYp4eLQ79DwnPlv8KYzOi6QTZvBHciIo8VoIVnF/lbZ75V3E7Veo/TbBzUGBn/Dw
	RAQ2BOG4k57IeNVKlpoVnSgA/fldc1p93PO0RHd+DilLP4DFfHY0SzZZQg4dA13S+GT6Q==
X-Google-Smtp-Source: AGHT+IEaKoEueLcUrwUOhuGDoVwbtg1fKAFRiScp1E/Qo9EgYejA1PQnAX+xAskmVNSPNqS5N9ErCg==
X-Received: by 2002:a05:6a20:c6c2:b0:1e1:ca25:8da3 with SMTP id adf61e73a8af0-1e5b4820f26mr5938589637.20.1734534980432;
        Wed, 18 Dec 2024 07:16:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5addb1asm6364819a12.46.2024.12.18.07.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:16:19 -0800 (PST)
Date: Wed, 18 Dec 2024 07:16:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Message-ID: <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-5-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-5-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071621_752431_660F944A 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, Dec 17, 2024 at 11:35:35AM -0600, Ninad Palsule wrote:
> The system1 uses Intel common redundant (crps185) power supplies so move
> to correct new crps driver.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

This patch will need to be applied through an arm tree.

Thanks,
Guenter

