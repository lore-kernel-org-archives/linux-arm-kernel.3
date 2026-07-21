Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A77C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKprdM3FJ8Y0l9QeHX3vW8ynrIYTmEZdf02qd2O/TJU=; b=TAHNeLKN8ZYXHv04GBMPKRGwko
	U4huVu8q8xvrJxjd9Yx32wb+ROUcP0wdUasyHL1fQeSvr+j1lJE86cgjXnFPnOboSS1WBZB1bgVIn
	vxdVjdTrGbrX5JXi0yy20N8puP3gKGEIdG0DtJwYqJrrzat2hiq1AFtEzUlmyDusiGC3B/4jrfAi6
	n/bHTH5LZcwGyEBuvGKD2JvYpPWrnRH79/MJ4NEpNA0dFNsrClhbcGeLi7HSdxP53Fc89L7aoPtc5
	JUgcvW5AZR0HpSLEp5n8C6E92CclYA2WXiW6SYRlA1GNMmPF7eNOsNCzJKQgiqKs7n5xoH7wawJOE
	/hayYwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDRT-00000009xPh-2s68;
	Tue, 21 Jul 2026 16:35:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDRP-00000009xP3-1Yhp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:35:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495437bb891so42993255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651733; x=1785256533; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKprdM3FJ8Y0l9QeHX3vW8ynrIYTmEZdf02qd2O/TJU=;
        b=VQHsvbFoiDCvHM5uHWtEz51uVMLNMYsWSzPI6fNyQibnY2SbX0D61wr/liiDRZiTf8
         L+n4o6CZCiqyhMMRfV7RIqDpvbqIsjOWG3njB9eUmU/eQz5ySO/zvKinyQoUsgGsnVL4
         waUmN8zZ+2UNm1QgHUEVrhY+3FbZ/p/kfcSVrnl9WnS6cpeGR9qLdcaYFDAD8tcY3qk5
         Qlkk6udSFNwun8tcfl8bzr8oKaCUBiv2L8p+IgrPpOdM+ml3XqOd1cbHSoOMw3DVJL29
         SqocMD66CRdo7GryBmaz5SaN+ILwgEFWkSv7/k7StowJn4N9uUFqsG3rNwtAUZwU2H3I
         BhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651733; x=1785256533;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKprdM3FJ8Y0l9QeHX3vW8ynrIYTmEZdf02qd2O/TJU=;
        b=e15U17+9b9YFcQV1/I2DmBg4lJZYeb15WT8eGb4CVUxQmjTzR7p6mhH8I4KuF4giUH
         nwjayEg8vTUuTGDofTg4HV3wWPuX/OKVMNlmUEI108lozXPITMGjmzrt9JVEnQQZpN/B
         7nw07PW3cQw1YP3OmWBf4Wp528VwUQAFr+/ucVKJyoi06+mjP5G1Qe7m7wsBOcETiHpE
         jhfpKU4ocoo04pltxyVpsyrW+D3PpS3X51ogdizCs78UV1ubrMcqPEi/mXFSQOdiDoNo
         aXhkbkDI8iZofcOw1I8fKzYs5w/4mx9KXGo7iK1rxRMJ66W3eCyjFSopnpgQOmUe3stZ
         9wgQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc51uYXsya35cpMY6+zbhS7ih52pRgHU8w+LmfguwL+6IHGeXqDwv0CQVWW0VTCnJpfGbQwOAC5kBh+GNbcaw0@lists.infradead.org
X-Gm-Message-State: AOJu0YyYRWwVpnyXvaNr7XdbcSMFC0QJxBWp8/6A9eS0yb2f+k1cKDch
	/FKkQ0PFolH8IwxIzRxlGMht3sFd5uiYb48XrL22VnnWygmoMcLg6FXwyBCDqCdq328=
X-Gm-Gg: AfdE7cm+12GmVZJ3xmRs5Xm14VRou2aZx0WZA/fXZO32ZZOp7oD6x5A3NV9Hk1Dp73R
	Y0Q++HKROMpGQD18QWwkh4pAmvk9e1MxOhTfbjgefU7fspI0+Y+kBRqkW3XaHAeBbNH7lXnFzaN
	nuNqA0DWkoe3V7d6to7pWh+J3c03zr9VD0s3NzASD/veSfUoAx43fhpXcsDC17RAR3HjW31s87O
	W+WIS547xJLmvCRUCKWWNXoSlhrHuBrUeFoYdDpM6Il7dQS68egjYclFuhtPskPObAxoCwKWQpQ
	DRYC1BMSSvwIkB+IrqG41UfggHbH1gUz71bOxCJOv6gR9yEZQEP2SFUPQrqONGPYV/IHdRI6mej
	3D2MQj2kxieKkMpWT9z9OeDFW9cW1TqY7wyPNs95hiHC3PprYcAFYTL1mzRJFMRAs61gcoSmJwx
	uAqTVOipiI6Bvdq6cYSGARY6nz5C10sAyq07/Oco7L3DGAzyxnHlXb
X-Received: by 2002:a05:600c:154c:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4956a4f6532mr5460255e9.8.1784651733215;
        Tue, 21 Jul 2026 09:35:33 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a508aa6sm5288515e9.7.2026.07.21.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:35:32 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix
 ma35d1_clk_pll_determine_rate logic
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260721021356.288506-4-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-4-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:35:23 +0200
Message-Id: <178465172376.2337945.14489744680090859988.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uxWFp29cQ2frkqcvF0LDf8QBVjMH7JZLS0lj7F0LpTg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX5/RZrZv/zWZ8eAFZxuPYMmrc1olGchvnxvYm
 AFkTO2ieJGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+f0QAKCRArRkmdfjHU
 RZghEACMKP49aqMhPqFuQw4AA1no+9cYjzANJhrDujH3wiu2SdxeF6PyFfGiza5hNNP+GWfngVj
 ZSFGkc86YYdqqLxhh55eZ3PpFo07h63FhAzpAR9WwwBKlale2SAE/HJku9CsB0gw+nMIPhgwdT1
 y/AMNTpxUsR4LxK9kVvws4EFxeI9txcy3Y/SNoVioFqwXZ9q7x1SntfGipe+Z/+NAJtjdNGrsD8
 krj8NUofk70txfgjgtgQwcy5wDrPzumAL3XpjfWPT+YwtB4Yob94yyPAyk8L7MMZigkONrodY9M
 pWphgoUJf7ZDluD0Ci+B6/9YkyJq97Wn7zm/tBQIKri8tARZ8orIJtt9utXDu4nTEuWmKIGJaPD
 qjXb2lJS6T6JakxUvi5wKefAQZ8BHmI1ET405v9tNxLO3QukRJtcJBRH31ZhtQ+vl16DbjMFQqL
 v5dKXbAl3MrE9XYUipFB95tQucl5frBC+EA5l7YvGk8cZCyEPWQIY/suJU96USta26u+bdT7sE5
 3Z7V43AQe19fx0v6bJUCS2OFoVX4WNKnq908HKEC6//YLiWhsURALzQ2y4/o2wS0cGNhbcqHgAx
 eDONXsZiSXdGyyAersNhFl/h5zIV8CzC9MEoVVc7H8sAFrdYPEEzdgAEwJuWgbpAwEHeY5FmDDt
 Q7VijLEeakLldrQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_093535_431692_E7D51ECC 
X-CRM114-Status: GOOD (  13.66  )
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

On Tue, 21 Jul 2026 10:13:56 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index eb9d69d2077b..c7c0dc91a012 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
> [ ... skip 14 lines ... ]
> +		if (pll->id == CAPLL) {
> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		} else {
> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		}

Small, non-blocking readability suggestion: since we just switched on
pll->id, re-checking `if (pll->id == CAPLL)` inside the merged case reads a
little redundant. Would it be cleaner to keep CAPLL and DDRPLL as separate
case labels, mirroring ma35d1_clk_pll_recalc_rate() just above, where CAPLL
is the SMIC-design special case and DDRPLL uses the standard calc, and share
a single `req->rate = pll_freq; return 0;` tail? Roughly:

    case CAPLL:
            reg_ctl[0] = readl_relaxed(pll->ctl0_base);
            pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
            break;
    case DDRPLL:
            reg_ctl[0] = readl_relaxed(pll->ctl0_base);
            reg_ctl[1] = readl_relaxed(pll->ctl1_base);
            pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
            break;
    case APLL:
    case EPLL:
    case VPLL:
            ret = ma35d1_pll_find_closest(...);
            if (ret < 0)
                    return ret;
            break;
    default:
            req->rate = 0;
            return 0;
    }
    req->rate = pll_freq;
    return 0;

That keeps determine_rate() and recalc_rate() structurally parallel. The
logic as written looks correct either way, so please treat this purely as a
readability suggestion.

Otherwise,

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

