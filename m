Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC449FD9E1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=; b=cCRvbMzQAzWm7uDoI/Tw35UDMm
	IhqGoMiiLSKrZr0w2LLpvLhq6t6WtO5zIlY/WFptZ8T96iKu/cJ2wLpKED6Fu64TIDs7TfeUkOInp
	qO7GC2JlMZLDlbM1VxeA+l9tOu5Z+315juwO976LCc7o6b4Vn/RLMbvr59TA9oindMokHSP+BP7bh
	X+QlwgiVlJhxU2HplP+Bh/3xlqj2v5zODQRV8qxNeca9NehxFxieH7r8xUfhg89pYvY4SyMToD+4K
	0agAOCrEGUWA+v1qm6Kuu9/Ulb+nnhf114uk7/c3ruYC4S8/K9/+ibRB1jqQ0dfBiriJEa29J96Zx
	KcXYcGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjHo-00000007Gvx-13Wq;
	Thu, 26 Feb 2026 21:52:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjHm-00000007GvK-0Iqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:52:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad3f12a496so10363915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772142761; cv=none;
        d=google.com; s=arc-20240605;
        b=Pb4BmOHc/8ZDgESROnZi0kcgOwB5ibCQ5jcoB3WZcScy2/0aNRUlq2z+uMQwcOZdtT
         HYV7h4lzsp+9D+XFsVliyVc4l/hD6fgeAJB9DS4+yR7I4af75W89LsKCgLHR2tO2Jbgv
         aQXlc6jMTy9701K/Kkl3pSBiG9d1cJvC+lZTxuO33rJbGzVCXZ83uELwAIvdaqQ+6+Zs
         tVexGOHEvwQaaCuRj7coxXqIqHBhI+s56M1C47dxCR0zjgSPb7qV3CD5qqfXBOBb6l2x
         J1O8jH/W1XA9YBXZGNwyyEbAu4ecrzO/NGtNRLdCxgHQAFSSaz19jkJGFfPcXA1nhx+O
         gDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        fh=isDnANzQskC8e/Llo6gkMBm+K2Kwh4WX6ECeeAFFHLo=;
        b=iuXst5wXbgKfd018IfqExGdniZ7KKe8H0zzBV+ywOGuBI8th/z2pj3LeAP2+NZeZP0
         vtpo2M2z0a/mmt4ZkmD5ThCta7Bob3vlDpOEnS/yPU0c7VYjj/qMhppEzTOvLHz6bLcu
         EdGL936VYnErAhk4cYYgtJTXMv6ll/gq+6TW8aDkI6UnaXjHIHFS2AN3Ng1E4ecZYmiV
         5aNal8ie9rSxhF4cs7QZlRGIcPioC5RAK1HmJnK9drX1zsGdnSrwUQxkxrX0aZgd/8qT
         V05E+ppSVlVpyrsh6+LFbZWoCGfb7n4Rxj1cl3yeii2ylSpV8sq90Q45lrPWkK8vTSpO
         Ds6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772142761; x=1772747561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        b=g34GLP4CEf/Bkf9hy8f3kO4sHKRCtvZOtX74G9cD5o0sk2ZMyjRCQBuPpbQ9T514SQ
         tH8DBa0N76ygR53/WjbyE0G2FY/AfTgkl3lZW50F1fc+Er8O5hyhh3e8uJ48yWVfLotx
         Qcydn7yjJ31uVId431GAkne+raTZ4Y3WYOTJxXtO3oxTn2fc5lixpjWv7bRzYbOPKpoG
         22PvqiBrgCTy9vkboCeo9AkezdqbuCHaQ91uq8z34uLGDR1q84b81PbWTDuKdCAshtCs
         i8F40SRCdY4mlFVHB7bkYAVsKwUP2T4DUVIaz7taxtaB5N+2VTxBd0y+wUtUoXtpSsyX
         4FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142761; x=1772747561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        b=lvXMrNeX0doyfxHOfqIFIAc5tqfh2YO9zeXJ8STjzRVZRTFM9J0TCGQNqBJ0T8Ka9/
         MZWmRVpGfEkVjHB5rdfUSyCFhp0YEjQEsLM56DXdXXXphgPrP7gELDIFJ3TaMkoAEqiy
         VqEbkK/D88y1ew5NSiBe5Fs8Lt3Ezvaca3wUzM8F5kEFnxV8IaoOP8Ayd/1doyZyv9Z9
         uE/iD8OrEwNM/76AE1EWd+TUepqmMRYApJJoQe3QCqarUwROO8u6WH1Nz+qswERq7KQH
         B0IAAemJFU1Lg9ZYcoAu9UOIu78F1vVq1wTg6tieVjGqNd6cAPf797GWOqVWUQZF8kZ0
         hVsw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WVYuU0sLxfa40iBI5VOSkskrd/EyoPdRBN5rZX6wnzhB/9+5BaoGoR2FHy9LhYDxKqZ8RWqY22637wJXKZdF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx26Lx4Iv/TcPrY7JFOakGsHYAtyW15fpLtl3UoJGyjgpITJNmV
	LC/um0VjsdwDzYHy5AxcuMQS5gJpjoLuZW/K/WYkbwIfQPZZpG8+ZUDxWiaj51MH/UKGPleP4rz
	lvpd3kukEJjzXajg9FC+0iK9MozRCspY=
X-Gm-Gg: ATEYQzyanJYepTupQUCieVm6OTZElHJryyijE/cF65fgTsuHi5LuNIsIGu+cAcFHlGW
	DICDvofc8ImDOGwCkRPiH4Y3kJVQnoEm0a3+GJoi/BK6CQzMao4ZlmFR8scA3iVQb2Uv0Yymg0A
	J7TkgKfF66bhoi7hPUPRvP+rWWTXibM1FX1LnGs7/7uqekaScP36LdysJeVqiEqCJPYku9bj/11
	lzZ/N1oJzGn5hHvVYC9y3FtlfE1bfKm/RLetOE8Jf3uiH6M7qD5J7kXcHyA0UD1iNbvSrCSYn2f
	au4QdkQ1xc68Gz4JGNznWs9huj2JNRLN9vCefD/dtfXhLqwwigI=
X-Received: by 2002:a17:902:cec7:b0:2a9:616c:1716 with SMTP id
 d9443c01a7336-2ae2bbde27emr4684925ad.26.1772142760989; Thu, 26 Feb 2026
 13:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-7-nick@khadas.com>
In-Reply-To: <20260123022258.136448-7-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:52:30 +0100
X-Gm-Features: AaiRm51djimkK_UgDeDWQGfUOzE1FCcEV_pCUmahQDUWiDkluPEZvH3ufqK3qJc
Message-ID: <CAFBinCBOQv7BBzqC6vo=eEV=rV_pPD4oLCWp-WL0mS0bUENE_g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_135242_115995_335710AB 
X-CRM114-Status: GOOD (  10.74  )
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

On Fri, Jan 23, 2026 at 3:23=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Enable the SARADC controller and add the adc-keys node to support
> the Function key found on the Khadas VIM1S board.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Applying this patch will require the previous one to be updated with
the compatible string.
Even when the compatible string changes (in meson-s4.dtsi) this patch
will still be good, so please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

