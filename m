Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66337F417EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=203p8V8fa1O69uWIwahNnr1A5Lm4LwlXFs1SL4Pk5u8=; b=Mn0JwUHrfyPGDb0HDaq/ERmr/E
	MNdWs5CBshnw3sLVM7DFym7MannrkTiHhpjWdl6Jryt3l1K3Wc/hq7gugtgXX7AU9LZw97aj+RHA3
	kDqO9SgaOCpX6BKGw5uGQ4e1sfHo++wkKI9CBMiWAhOigFKTdCDRfz+ArsZlVMVseq0NdzIEf0LrG
	fZaaP7SmUc+YDyMJFnocNFdqTfv12UKvWBSnbQgME6wrfO2QCCZbIo8317+Azlvf3qKQznUYam8wd
	79d2XHLBU0XtJDj+XGhn6uuusZg96zVVZSUnbdqx+VFbPyG0zmYziuE6GN82zv+nr0NpKrewce+Zf
	Uex6AuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc33-00000007XBF-2oSf;
	Mon, 09 Mar 2026 14:57:33 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc31-00000007XAC-0ZSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:57:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so2794222e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 07:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068248; cv=none;
        d=google.com; s=arc-20240605;
        b=Fh50E4Hn/FapfMOI6Mizmm9/HwcgfdZHjI79WJD0ImV6s2n+Wr8/NLOqIcEVzX35Bv
         WGVmN7punURkrEP65H08qj543IGrlFcrpsXT7ozhnRDbSMAx9sv3QuH4ntsiyZf5DhxA
         vjDXsqi3Bd3kZeEKH7QdVQmpfEFl/zw3lt5W2JJbnS8nsELUUgUxGElI1wn388LS/cun
         uoH0aklVKVv3ayRj104Rt7ZsH6ChzfUCT8deL3yzvX0MH8JYDpb6Nzvm0H0C/nSgECc9
         xovf6EeRsxnBDSghZZ1ZeNHDs96tg5GPTy0B0Q/Q2hE/qGhsVjCBffaLGzjrI62Z4pOi
         eaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=203p8V8fa1O69uWIwahNnr1A5Lm4LwlXFs1SL4Pk5u8=;
        fh=yJ7FNxARf4vQ+JKeFVKEQJxQS9juppKbat/xn8w2TUQ=;
        b=TDrryk0aX00H9if9jEIn3sK9NQrDcB5u867cXL6cFNzt0+tsPgBb3N9xmNoQR9FuL6
         pA+f+J8amc+s9HzqMcnWiEGeRJJfbuxG7zV70Ba1XNADXXF078NgECLSfW2m4g0OAHj2
         esd2VnsByrTvjS/OhnS8Vfpnr/zoMRzlDQ4CujSvlMwFzCIuWpjyq42MrgPhZNydDlJN
         G+53fCqFapjRDSKQPvLA1R7SP+y8nO+TksNPLzogZTBASHGQhNgk3+mzly/qzTAOlyfl
         tb0i3hJwXCjE/FB1p+4bMhTZocrj5Ot3WccLQG+IhqqPLqYlhzS+0exs2/0JB2A7hfAE
         /6cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773068248; x=1773673048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=203p8V8fa1O69uWIwahNnr1A5Lm4LwlXFs1SL4Pk5u8=;
        b=gw+erpeZNBrL1hYlPXo1PUnOucAVuM+TLZLw93KcWP5IupRncxgTlNfwyYgxS2yds2
         +9z5Ur9Vsl/s2D+xuB0pys7Je3pqo7IQ2dbgiYJiuOlLUzLPZYpuNDNXPym2RFCureb+
         4f6JXAp62y8v/rH4t5lqCblOkQ8OCJsxn4ZTsy2LxNZA/FBe1I8q+SH7UK7mGu4T3zVC
         nmxvVQmscQTdOz64OrJDlOVzOZTTDOGwxXuS9OGtIPRjbyEzzv1aFBV/FNkQYd0Heal3
         UPxnEnQEi70RW+kh5q6m082ZlJS2h6Y2e3GX7XJOujhK/YU5lLqkLtxrNPDOIQRldU9m
         0PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068248; x=1773673048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=203p8V8fa1O69uWIwahNnr1A5Lm4LwlXFs1SL4Pk5u8=;
        b=ba+I9esPC6PQqSC5eBlSJlWsG+367dw0z2SGZhaMeV/A2++Gs2iV3yFGsRLdKx03S1
         IhDIrublk0tNbmBVP28fe+lNw/IgoohDRSK4sa0gkk4Bnohf9uRmT3p4ZFfDMya3bA0j
         ASZie+SjTvIWv46Ttck/kvJTJSQd41hDbU1fmtvGi2ro63odDVv8taD8iUPfhShIDx+T
         bfrW55qh9LgHy8GKRmeVspxEh2RfH49PT4LEkDAi6OnJySzUyjs85SLVNh9pNlLle1jI
         yaE0ZroVGiXp+JVO0gey42p8iO4KAb7rMjUIjDd/dfAj7C9gdLfq1fIBRERwlTZ7QwuM
         Nh9g==
X-Forwarded-Encrypted: i=1; AJvYcCW3YxQ10ser/U5A7j2QXvtxyWHN+YpRXHjBtgHRCDizPxGFAqSqNwwKofduPhzLY7DTujDtmqTmI25f82daJ+aF@lists.infradead.org
X-Gm-Message-State: AOJu0YwwSiyJMPkixqECkV5zf7+u+q+uInRE6WWwNPB9/hsMz8YEI8v8
	ImJgMYM9APjNm6Fq0mwdnkIRS5EMNvCGNguP0JWbwb4RR5sBV6DWaIBa6WTXtrYfSVKEwoejR4W
	fVSn502SwUfFmHrWgKMFdeneqp3T0k64=
X-Gm-Gg: ATEYQzy5sXSvKCau1NWk0pt8oewe7tOBEjx3qjRmTCi/5ew04bM1z1T+J9Utuy8yiaW
	sJABJ95vrmjL+ZXxiwL/njigI6RpSGwSUEGGp3MMvwUXWEvATKIwhLrYLP+DPK2xzGMPPn0Azox
	C/Dh942fMzGzVwSZSxKL1qd7Mt2Do3S/ZGaA1GkVQq4ytOfeq9xKaFYHQlb12nmp4jLM3XU11yY
	FCvkE6R8TnZlL05gzda2j1Edng0JbmWHdLSuZQMGR+z6t3C/6DLbhhQF+J7SQps5pJ1J4UKrpcB
	j5XoRC/ZrsYZRybGXuDT731AOwzwaonXvoVyIPgZ3hEp0mETDitTo9r0/LZdANj/ibiju2dc0WH
	4ByDynPw=
X-Received: by 2002:a05:651c:2114:b0:38a:2e66:c9f8 with SMTP id
 38308e7fff4ca-38a40da3e0dmr40369381fa.32.1773068248273; Mon, 09 Mar 2026
 07:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260216010219.2131484-1-festevam@gmail.com>
In-Reply-To: <20260216010219.2131484-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Mar 2026 11:57:17 -0300
X-Gm-Features: AaiRm53IxFEt-LOkrgzXXjheCaCCVTZVH7guavkF2brnrHw-jNlZBEZtsHWY-9E
Message-ID: <CAOMZO5CNB25j=JoK6C7CGsXFq5Vg2j=nfrbaL163qjeWYa4J5g@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
To: heiko@sntech.de
Cc: jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_075731_191904_E202D8F8 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi Heiko,

On Sun, Feb 15, 2026 at 10:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add the PMU GRF and IOC compatible strings for the RV1103B SoC.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I'm sorry to bother you, but can you please let me know if you are
happy with this series?

Thanks

