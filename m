Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F7106ACE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=; b=CFNyX6MtRbuj805aDP7OaMLdZH
	Eo0VuQ2/5VtGJK3waHCNflUNyuHRZLzlCgUWCvWelzolb4riWLa3b8+/cYqnYDWqrj3pcyAN8U8ss
	nWxHhCqxCufK07tLa9G0rXthbdtiUFUFMX6nozso/iUdA3s406NzeZGZ8CgL0xgSCweKrdDorQNKW
	ma1Q/iLgzSlwxqg28OFnvA4t2FF/nzflvFCyd6CK83HxSBdEl2Us8gw0ygtQ/YJ1erOxPHFIFO4PG
	fv2W71R/hGCbybx9DiSlqAvqCfdU7SXEVHsTqF3No8skiCxKucYSYPCllcLlv2CuZbKhx3LgzmIDp
	RhyiqLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJO-0000000FDVC-01xR;
	Thu, 12 Mar 2026 20:07:14 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJJ-0000000FDT6-3TIC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:12 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40ef10ec84cso1017049fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346028; x=1773950828; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=pumAnSwMDCXT8b0obfuLwu8stNEgafMp/4CuxrDsFOX63suGKPRX7TltgMAJ1L8TmH
         EYnuVUILixAJwgHooewxKCt1ja4sUkoa+I0qXe91mqCGKB8L1pIbKTh/74h5UsNdBcGf
         SXPWLUsUYJrQcMWjAGhLv0wFQRB0cEiFEQyD896XDf/VVXOGbqDIiY13CBLXkObemV6B
         a5pSYkrdpr3pw+Ihujyd9WaHIo+WtAxHx/wVgPwZkhydxcBd3O3orOSlJ3pFonbXVSdl
         RrBP3XQY6RE/KfphewpWWQ/8wR8qmlSkkspZZatr66kccgR+7h9pCyiIhv9Mw7T87+QD
         RQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346028; x=1773950828;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+y1WK9bKYEMzE5cM7mHmluwniDdPir3jTdVAfeucGs=;
        b=YdqsYCEZjp4gy/XxO7sKSFKM0tCVUa+0LBQjQQfHgkw9LbGLyqevVBKLtc/RrpBVv1
         94ygFhlyRNxPYSwloCU5ZMBFEup4SavuZO7cUVeGVxE2piPAzgM7kM8uquLMjy0kaLSY
         aClKuYk8k7qz3B3kBYhvCqN6fsUX45v1lQ8XaZkt+aST7/n6+6cH9HzW5MUIJ1wp3y0S
         gfd5S/LgO9eMEzk8L1UUiRIrMjiHODf0fSat4SPkgD/yok/mh3975H/9gVOxgg/DYeFL
         +g2pzz/F2s6yaStTXg0DZdKNoYafeo8fJJjRvPw6UjNlPVZOUY+oH+oEvER3XCO6uNjI
         Ph3g==
X-Forwarded-Encrypted: i=1; AJvYcCU/PxFlPYvlEYH382s6DmkwPMC2MWjx3C2tADlIaauomdSSZfTPjC+7N+gQ/bSuiOn6KdrWa7CrtRRAypOm5XvF@lists.infradead.org
X-Gm-Message-State: AOJu0YzG2IRQ7MPQ+G5rpqYC59EX6SOFgGMBPUbq/IxsKOXKphEhCytF
	KwBCh4IOwCcwABMlF2u143VAjKJ3bJ11SSQh+xJcFFsk8XBHVpnAQ4JemVTFL7pckZk=
X-Gm-Gg: ATEYQzxAzvlR0G3wDnUlQbtioaV8rbuuz9dcXyRIzDyM4pQ6JP37UvLVHJzhSM2ocWY
	b/lxgsCptYvgMFggDrAjDNRmbWxWSvoTYvfTp1SYlmCHC+dGmnYf16S0g8ED/1Ceh3gdtKWFCef
	fUsDGlEFCCR3R0PpOlSHbG/nWN8LP47CexWU7t5ko0schCMlvuQwIZptObSD3Jjzfy6wEwZD9ZH
	IOseL04Blw360dXnsqpDRMOwZtj38zqNRCFbeqmol79veZOYMwU6Afr6/twD2ZxTgidEDFIU/ws
	IYm5XgNjlFgECVIk4tg0CcaLkSctoObV3WFSCtPQQghGlUoZiMMeN1pHBnHAi3kBdiS3BXgFME9
	g27QD3/CN5OugpIPksZ35GjljrH3x0LlQf1mSH7KFFSKkIbw7FAJNm1iE0Ul3YhibpMywrn8na9
	bqB/QCec5GAgXdy8WryTABLNWv8Ucp
X-Received: by 2002:a05:6871:3864:b0:409:7a01:6e2f with SMTP id 586e51a60fabf-417b906d7e5mr406126fac.11.1773346028068;
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/18] Add support for MT8189 clock controller
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.2284323207748123029@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=515; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lKJ2mS8qshYtbORsyK0ngNUDnpsbzs9HMnnIPPn7MQw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzPi+0zWeulMgYec/oNHyb8sbOm7PTreogHt
 ekbB22puQqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMczwAKCRDCzCAB/wGP
 wDfIB/91n7afDNKVMM1YVnaRi8vpX9xoS/2fQLT+wzZC/3m9wr58g42+Hy7F1+SywRjBf8f8CWn
 BlwpL0zR+GBEnDlPiWeCojMa/oNotD6CWbl2gXYC33sllryI2rkGy18PxfunAxpNBAm06vWz6Lr
 YvsvuBJ7kEUcqf8+DH+bgCKLL/2fWxaI6Cpj/rggJGywF1rJMvK/5qwFPiuIUVDAV3xRL09Firz
 uDocVTpeY9TqTi2Nq1MU2MfD+UH2EKd/SzRjDlgDoyOmTefufsLWnJCeARld89Zvg/NIOTGWdkC
 WVTaGeyWsXb+6V8GO7rcJ8/3R5W+W5sdRGFjjE3ewiwYd1Gd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_130710_142647_31B88F04 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, 09 Mar 2026 20:04:42 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Changes since v6:

So this should have been [PATCH v7]?

> - vowpll/aud_adc_ext are fixed clocks in dts, remove from bindings.
> - Remove unused clocks (clk_vlp_sej_13m, clk_vlp_sej_26m)
> - Fix confused naming: vlpcfg and vlpcfg-ao
> - Correct naming in vlp-clk driver: vlp_fmipi_csi_up26m, vlp_pwrap_ulposc_sel
>

-- 
David Lechner <dlechner@baylibre.com>

