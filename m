Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lw1CQk3OPOq0zllcKBx/nVguWCpRXrFP9xKbQEaC04=; b=cy92MLslfqazIkNAvGy0qsZc12
	qjCyxu8daOT+6FFBXy0U2IwM5FOBQ+wvqnndv65lbwvNEq9z8X5I0ATBA6sj+gPD3yp727UxI7P1i
	h/hBBDEo5DnpbblpANlzmKUIRIgpW8fMaiPzidwI3HniIbe+0LqH87G3enzfXohhsEHE6ygk+VfP4
	4L/R3UgEU4vlFlTLuBU0tAQx/UMtGzFyli0H80vE1kLb1xSONpNfImdQVpqSQngMiyFnqh2dp4QUy
	ZHGXQpq7F0iOP5xJq0CHKwvN/eCm62VEo6+IO+dtz4Z0DgFQ8KyV8au4DOAK3X19oFtgc2W+unRoa
	dToqio4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umf1F-00000000Xif-40qM;
	Thu, 14 Aug 2025 20:57:53 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeyg-00000000XTX-0Dir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:55:16 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-30ccebab736so1384582fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755204913; x=1755809713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Lw1CQk3OPOq0zllcKBx/nVguWCpRXrFP9xKbQEaC04=;
        b=o9xC4o+qtrokH7WVGNHN8pdNNLpiZIqsagC2MGA1P0RhoMdGqOnDkKKG/bBMjydD8o
         XX0UHa+djquzoVHWCbHjOKgYXGTfnpg377Pi+7W1fKHC8y+Ag4E59tM5mtdgz/nYKlRg
         TuJ781hx0q0APAnV4T1zkwOB1mOM1Y8LGWtxgHlQresX5RnSShKm+oZk6q5NPw31u03S
         wBVSekeACcuZx7EhdaJm2p2bQY8fbnx2QWbnhqZ/8mDfir/am2hZ89WEmVTRQ1ZXsWri
         zaVKbAhDVu8PdohOg/okJGzuvw507Snqp9lIWFnvd2nHftl82pESd1Fmzdv4uRU+jf+y
         Ddew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755204913; x=1755809713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Lw1CQk3OPOq0zllcKBx/nVguWCpRXrFP9xKbQEaC04=;
        b=k9Ps55yvvPZ8yg/yzMWyFXUz5tTXrtMM0gL+Sy4QBZ+3UgVp2pHbKUw8/WFcJxf9ps
         pO0H5l2fowlv+epyuVzHWw1hJiBWs97+wEFi+ouIQhf8ux5u1J3irlEDR7CFbm2s/zkz
         0GKKHyTTB+MOVRYyuMl39OdAOkmxw7dpw0JZJNFDJW0nZPId9F9iZnN64GmniMgWfaZg
         5L3zbI1UM14Zlfue6mNU6o2Y1HIspyjndJKwpBi0kcckznERuQNeFw+lUjXPWsC5XixK
         eHmxCYPj8UXwnFJkFyJw8OADo4DWz+21bf05eukXIIebz/juU7ArP+86eMpy3PMI2k6d
         Y6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVTAHCDFyfJgPKktTHktN2uS2hEDZoBM5u2boKmxXDy0w3kDiV9TG83XahROPhwHUC4/AKmDa1I2GhCsEi561Ts@lists.infradead.org
X-Gm-Message-State: AOJu0YzziPioYkGTL0Si2A+hdDHvuq9sVKe3J14iAff4azY++K4u0FXY
	2zk6LFcdAsgtb785RyYrOk9LSad7aR1GJUoq8pBcQlK79F6m57qlR0hsBDGet3VQ54M=
X-Gm-Gg: ASbGncv5VIPx1l6T7PXZb6jhjKsOw9kQXFp4SYHvrAdmzY5xTxZmpSIcxhcJzc7pZ0r
	HuAuYqXogDhX0ZjTup8qevU/lblN7N3qA8Sn1pUt3n5BPe4jALBKbO0Ja6Zc8udM56A9JIVOzA0
	5JYYWpHZ1oYTsk9fvvG481HTXav51Y9auOhH50cAM5OpRdFQSi5Gv08nYqlSxMjMHHhT+y0oyjx
	Uw3zSHIM/HpI+Ww/+F04RdEFE44a2eQfGwkHrm3ME3X+9q0sQGOUSSTgZWtuODVOBKrwwKAOILN
	FsYRoHXOpF89r+AQH+ia4K3w6/e7iBAMuTMbHukbpf63PQaLlE+gOvDa/Dj5TaYuCqdvOSrRAKY
	s/CrRiJqQb90BobD4n5tyFeia+hoFpFsmF+7M3NGRritIaNl1fgcjCXi76ymrJsv166wOq22357
	xjV7hyoC01kw==
X-Google-Smtp-Source: AGHT+IE5YbjZs2djBXKIUErUo7BXp2zMu/SzcdDO7ZnF6dPRtxmnztErim872SLpP49Q3QZx++e6ng==
X-Received: by 2002:a05:6870:548e:b0:2ff:94d7:b006 with SMTP id 586e51a60fabf-30cd0e61eb4mr3135219fac.13.1755204912792;
        Thu, 14 Aug 2025 13:55:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2d9b:959c:3c59:5831? ([2600:8803:e7e4:1d00:2d9b:959c:3c59:5831])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30cd018da90sm905636fac.32.2025.08.14.13.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 13:55:12 -0700 (PDT)
Message-ID: <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
Date: Thu, 14 Aug 2025 15:55:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-2-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_135514_336270_78642B13 
X-CRM114-Status: GOOD (  10.62  )
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

On 6/16/25 5:00 PM, Sean Anderson wrote:
> From: David Lechner <dlechner@baylibre.com>
> 
> Add a spi-buses property to the spi-peripheral-props binding to allow
> specifying the SPI bus or buses that a peripheral is connected to in
> cases where the SPI controller has more than one physical SPI bus.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
FYI, Mark's filters won't pick up `dt-bindings: spi:`, we need to change
the subject line to `spi: dt-bindings:` on the next revision.


