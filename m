Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CAECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhZDrVrImTATkIwPwVSPaOLUpr64DrnZU8w+ycyCg88=; b=gfnVwg3PkfSIjnNrl102KQkbZT
	BSWrPOIVkaQK7gYP1Or6h7Wd5/elz5y3dkPmWuLs6s2DMaOUzLCKKBmxNDCHSlQ4HEgwhQouC8puI
	811HWAaW4smls4PJO6r58Jw6jelgg63QKtSDAO6MOVMN62JkLed27Yo2gJesxg5n1V0y6R+U5hNFm
	8mgYOoeDyA5Geutz6Zw8ZEqhpqqU2oznVzzP2eEiAnBOEJ97LsbLptTdrBDYv4E3VQkQtSrPH3L2m
	REpKdUvlCiFoQF/zK91wuYdNqUa2yFyZBSKIxG14rqo/It0i9sWdOBI00UJDKFtdk0trEUtKN3RNh
	puO9qADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdSk-00000003QMU-3lZr;
	Fri, 19 Sep 2025 15:55:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdSh-00000003QJW-2hyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:55:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45dde353b47so12362935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297350; x=1758902150; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhZDrVrImTATkIwPwVSPaOLUpr64DrnZU8w+ycyCg88=;
        b=lGqK2rb3PP8EK/82YHJgjFuPt9Fy7EB92Nm5Kkoyrt6g+Nn68snjxWvGhdPQpgLGkg
         y/9HVG/aW0+0qqY0/i/f3uFx7tJUrSEr7k4jR34U/E7LSEjH7ayblV7vmIB67h9yANsV
         hdvHSO1wsa9CxhYPoCWCfU5s2uFx91vfRMeqQLNoStkCmMZ1JvhzPFFZJwsrGHNkadwB
         Ff2E4AcfZVnyznRR288GijCnCljpOcO1F4mMeWpX2JSefbcFf/o4A/FtAQie8wenU1G7
         ZyIu/UHpoErVgoO3OGD3Fx+D7KpPSYAJGvHfnrc/dZnw6Hw077plE/uuEZvhEjTpEgCL
         +gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297350; x=1758902150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhZDrVrImTATkIwPwVSPaOLUpr64DrnZU8w+ycyCg88=;
        b=gNmNUoKqYFGEAl0rUY4Kxvaai+cSge8goLaG0AvGn7Ykf/74SVMy6VP5jf1EEIaeh+
         nnjBrm9rh48e4tGikoIxr//ZBTRp8j6fV4qGoJFJCY8oGzu0HbUjn6PWwp7ctCkzO5UK
         WlceKBICIUTkKwkKqkpmMxXgQ5qCeT3LnmRzZfSsDDSAajvep/Ixa01EMdYsTc5Nga9r
         TnsgDtiucjiwmwkUHShmsKVXSfjNgVi3WD6zQ9PuBxc0fO4pRhfz0RyE1YaYWv72BG82
         c3OQpvh7PqXCeW6tjtvy2mcjR+i4sk0LbS5mIXcawOTbp3z/IStqCETin7Ocs+ieG7hS
         WBYw==
X-Forwarded-Encrypted: i=1; AJvYcCX+nlnf6iAAVTtLPWItOqh9ofxvMJL13iz1BjVlsXqoNMAMyvlaMm3BEJvUaAGm0JtG0aa4LqynNj7nIZaNV9jz@lists.infradead.org
X-Gm-Message-State: AOJu0YwdEj4Nk88IUuwg2eQ5Y4PssWUToTu6/pu8X46RZ4IBCqg0FDLP
	Zq+Ml2EEMyv9k1uPba74wNt6UzDvD6hyD8+qa7kb6VmPr3t9ZoCR1MrTYvzwF8P5We8=
X-Gm-Gg: ASbGncsYJzP3Tfcqnjx22GVLyVV4vbVI7gdGWMpUUFXkWTn/1Km5CcVjDDI49CpPYDg
	INWq8ArjsU0hYHCZhKKr2kqZ5OzAI0+cSRsvj/Bc6hWrj4kl0FOI22N7cqMGTUErU0U17z6z6Sr
	ZV9lECdbM4corzknGh3OD1qa0yQIkJ7MsxF0MqlLVjPSMvbHOmIEWHWp7LvOpUzslxDftBCpX8j
	YBZBS/4MREOd/INMwOKBxtLBqgyWsHScZaKfAH5Sm8feg/qGbnpi0p1WeTXAMS2E8APQla3wVng
	sAh6LaanWY52ny9obY5E9/Yx9C/OzAGs1aow50UiggzIdm3AbKNG6QKUXiTrcxsnQvuPuOedhNA
	ScKNjXngMf5LJm5G3j8c7qI+7egUF0YVjCnV8SKhrjF0xVeTdTYNNlSZ/82R2hF29QlO7QPEK5h
	gskw==
X-Google-Smtp-Source: AGHT+IEl+5i/c6BvX7hOfCLASA8xl2fHCvuhOjlzavUKXNsTQAa1+nFKeMdI1YW8d1Qlc7m1YSon4A==
X-Received: by 2002:a05:600c:548e:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-467f205a5a1mr35666935e9.22.1758297349484;
        Fri, 19 Sep 2025 08:55:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee07411f4dsm8371825f8f.26.2025.09.19.08.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:55:48 -0700 (PDT)
Message-ID: <20f38803-ea03-49e5-ada1-9998eb815f84@linaro.org>
Date: Fri, 19 Sep 2025 17:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] thermal: rockchip: shut up GRF warning
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085551_719661_6493BF34 
X-CRM114-Status: GOOD (  11.11  )
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

On 20/08/2025 19:40, Sebastian Reichel wrote:
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20250818-thermal-rockchip-grf-warning-v1-1-134152c97097@kernel.org
> - Add patch droping extra newlines in older chip info structures (Heiko)
> - Add patch updating DT bindings to make GRF either mandatory or unallowed (Heiko, Robin)
> - Update previous patch to only differntiate between mandatory and no GRF (Heiko, Robin)
> - Update struct documentation (kernel test robot)
> - Do not collect Tested-by from Diederik, as too much changed in this version
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Applied, patch 1,2

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

