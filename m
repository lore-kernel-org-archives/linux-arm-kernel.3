Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEC6C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=; b=OVK1EobWRxBkU6TCb5QEs9Ef9z
	e0fcHJQjlWT54Sc6+KmJbb/CWPgcP0McBEdIRsyCfyKEussnMjkUN1IPYeIXMSrcI3TG6bd5uk0+l
	SzLtwu1jwWZv56L1DYUs2cxUuXxBtQ7P149EjcaPUFiXhon3uu51kz9gZ0sKpkQ0PD4sqZFfntmK6
	6qcJ6SnMRm7ohJtlW8ETU1Hk8C7FAQVF3To720+pPqDN090/DYOxcqakYTxnlUAzrljbF4DmjRcIj
	xtmR5ymBeii6vQznfWhWqrt9Zq75JUtCWo9mVGmxMDa0EwKqqViuqB0YwowusHDzmd1i3R9HJMJoy
	nCdxjoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21zL-00000002pSX-24u4;
	Tue, 08 Apr 2025 05:59:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21xZ-00000002pCy-2TbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 05:57:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3014ae35534so4233549a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=vnl9bLzttUyq4vUKC12DPjrZN9M3f2YwuTNQhCKsrASenvp4GM8O+Nm72lrm7uhekZ
         N1KgR8e2sT5FQY998Y2DG6Wm/+DsQdffFuhJmxq43iyDct/kDkL7R9vJKxLe+VXtE5Pv
         wEDQp1Q1YFxzPnBrtMbDbxFQGQQrRRHTLKUZY8I2De/1HP8DBtGTNj3CKy9j/1Sndv2b
         V0d3N6IiVkYaB5Zr+V1HJz9QKDPLYdSny8uwr1T7lH8EiSWr+gKPkPDYB7gTtEPkkZF/
         iowyA/M8pRwsuNQIfJ85dKIWn1mMSLllmM2JvmknfpsWsLBQVUqTbniwEYO6UIeWEjLI
         kohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=SN6VM0LgphorSB6o6KqPCULJBJaMgooB3adTAQtNofbOzJ+xuBE9bILI2zZEEo9o3+
         dhnrlQe8a0uH321MiqsA51JmiirUVqyOFFoBWrVHAmHUhZw4PxivaLiel70e3aRtQrhl
         Kk+wpdhkVIZuFK1OSZy6oYXeN07F07WIz7Bm4sZqvA9bfgPNuT/eaNgWXoW+irfVXlNy
         +qPkGVHefrVWSpgB9xdI0L0TjzW6X531HCTHY9M0pYVOTrUHD90wtNxhylWHgJ4cN03q
         JLxBpqnb7MDX9qP7KcvvkSytP+A7KPCFcuhAo4Gk1mg3Y3OX3n+7gclulLgR0Vv9fmoN
         zGCg==
X-Forwarded-Encrypted: i=1; AJvYcCWtYTUniBCGLXq1/eeVCYfGmIP88AZWuuOre4fcIDJV6QUumLffnamhBoj0xtLnHgeTsCnLke6pnYtev/IKN5AG@lists.infradead.org
X-Gm-Message-State: AOJu0YzZem8ooAvHSQVSdZU2+O8Dx/3kMbHt41Pd9Dk+rKb3KMqhPLDO
	JIip7PFqlf00UW9/D128Qa16jC4V+7bCObjoLflu25oUea3ODp2AG69tkTr92gs=
X-Gm-Gg: ASbGncsgrTFIinjhhvMgf10m/8j4dlVg2kqOd+LORZgChDiD8JPyw8IbC1mmZLk8tfk
	l0n5ba3rcLj/oDfBcUiqP4OJlsaJwntKjzLQR7eVsG7LuLQEAQElzDlcTx/AvbMsJtDY3A7Enhf
	KdxW0gBWQUckVCSFfT3kvm0XSQiBbth2LVoaL9rNr/FYMULdr4nlN7/CA7265iUHypPTlYik1hg
	qXb9jTu5KrCWDCRXi6rvYncULfFSIZxjnvZEZKqOmjPYEm+V2RrRXkaSzhaXbrrWNnAs2YSbUBj
	Qq2mfowoZ1AHJ0RpIH6KEKoxNPYpIE8cLfDiNLRhQHhnfA==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_225721_630015_E76F9127 
X-CRM114-Status: UNSURE (   8.48  )
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

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

