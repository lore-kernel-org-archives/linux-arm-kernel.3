Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035A1C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=; b=EgD9f2ARKlTYs6ibhf1RxGp72G
	ROzh//YhjBFcKtJUc+95YkxcfwErrKQc/+qJcQ62OCj6tOOAb2pVxza8s1TDiFNAhTbh/Ulhh+vQV
	KwlD4GNB8kwyGStumyCuiTQPYNMAiGhE7r9pK/sMQSKk7+9/2goQNgqtP/X7bOnFrf6eakFv0Bza7
	vsxUmVmR9RBhO8zXwOfLOSTsmfQNpGgObpeS4ckQgOMiD6YIqWzdoee3XfUaDYWWVJp8HgLvfVj04
	4q9Y1D0vBLPblDJ05BbZ0HyF4SUKq91CgP84A9MSFuuvWOyn15FbZX5nAzzJ8Szp4X31O1eNJJShq
	bxrXaF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SJA-00000009IdM-0cXJ;
	Wed, 23 Sep 2026 19:07:08 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SJ6-00000009Ibw-1rH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:07:06 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e620fa473so7714615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190422; x=1790795222; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=oSaljcaMeEAtXOFh8MIE/iHcUfr6bkHZlk0JiakzkBJQvWkvn5ZN1is3K+MvtR6CpX
         wfPG1yY0GaCaBow9I7e3CijcfUofq8im6CXYhbff3O7T/9gsxkVuKAsZy1QkPWyGVxYZ
         dQ6dkJv136zfsh8r2vT9lqPUSpPNyGl7sLUU1S7vjkjvC3bmYhHo+dfLi3WiDEJvmuyT
         mzoqCe014dD+a3FijrVrxq144CaXrGo6vtvys3ppEQ3gNuRcIDkoR4YerNSfbOR1EXGb
         TQGfl9QxPZxfsXwDCg7CtBl9iJGvjtEqYLcGkZW0m1qyvczP02Fkpytj9YfDg7ekOC3m
         RFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190422; x=1790795222;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=PI1jI5JnhIqh8EhLGRwKBpC7BK0/Nbidm/sxO7xnG+jApRYMYCthNghFAqz3at1yOV
         vj4sL7yCPYL43CUsnw6msuLok2Zc2sAVX54JRiW3eBw5eqONPHQLjY48lg46QKNT/GOR
         wgQwL5NT809bAdAqHLN+3ewvtDwrjZbqq0VXPOkyg5kwdPgDMjrF416JNsZOEZyBNp+Y
         uKS6Uan/Gg5PNRP+4Ef8MWlaCZYOuX4SapCnt8Yd1doHbu1xzv9GVTHq6RLx28F1askm
         uxKWnW2ua+ldfQgF5M9vwqqyRSQwqnGGcPlmVZ10uPbnE74ecq1mOLdHT4t3+VVOZoNK
         QRlw==
X-Forwarded-Encrypted: i=1; AKwUvBzDh/KryPtkylAKJgPF2wWpj+gfR2KYcINhFoCk6Jkri+CPdD4i05NqCq3Bkw+OOX1sKckq6EXb13KoyMBX1VdY@lists.infradead.org
X-Gm-Message-State: AFuF++mW5ovIExXJPfWXDh0k7bZEkQT4gQut50aTFyVu3WmP1DT8/EEX
	zshAuB6AyZrsygyFxpL1wE3gGqfk2KRlF66TDipduh3sXwPE0O3x0Fpr
X-Gm-Gg: AYBFou28D/e/KhUC+HvB8J1UaLQFAUdf/M6z/amKqjbTz2jJTR86vtTVimHZz1qi5w+
	XWEovOVeReZkOEAPaI6xsgeQF5zFymjLbLEPOBl3Mvqyr13ofKX/jMDBgnWsLQiCw6HTcwW0l9v
	tvkFvWnPp6hW2TRZZP3WS8eEJ7iIMw/ll5+O5rAUBvNnNJgK/vSKCJVzWownNFCCnFKntSrQzi2
	IH6AP0ocPfsB15zhBdu/EUf/CIJwRe3ayouLvyK+UzALdHFF/csY8sv2rgRxA2G/h1n209+x4G+
	qfmLBnlumGTUUVleyBohorcGubLO/1i9hRNXZe/Z8P4GovdPwriocun2w61dzblqLI8s5Yb9gGg
	3eBLgti7xAVsIMTHH9Zmyy/6SQM/jbg82k9gP0n6NNdTqM36sqlOLpYLPkepqymo7U3laGvzZK3
	eqDEOIwW7iRwERBV1N/H/JWzZ0pLJ63Z4CT48V/+z8KhVedv117FcPz4yvj8b9bF6EAdAQTDtsn
	mDoFAlZ7wN+3G8Z
X-Received: by 2002:a05:600c:4e8a:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49fe66fbea8mr2319335e9.24.1790190422340;
        Wed, 23 Sep 2026 12:07:02 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm76197825e9.2.2026.09.23.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:07:01 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, linux-clk@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 olteanv@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 09/12] clk: zte: Introduce a driver for zx297520v3 matrix
 clocks
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-9-9c243796b6d2@gmail.com>
 <20260923184051.0BA291F0089E@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbapkTblkT9q_p2c-f6yx5A";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_120704_792056_60B8F44B 
X-CRM114-Status: GOOD (  10.04  )
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

--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
MIME-Version: 1.0

Am Mittwoch, 23. September 2026, 21:40:50 Ostafrikanische Zeit schrieb 
sashiko-bot@kernel.org:
> [Severity: Medium]
> Is the mapping for ZX297520V3_RFFE_WCLK intentionally missing from
> zx297520v3_matrix_exports?

Sashiko is right about this - this clock is missing by accident.
--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq0I0sbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi+RwQAJ7LdzarWQJsNGnuTtIt
v7A0IaCEADzg/eOTVZOapRX1DQ1MBLfOp8OAgAgWf+VqD0Fwfhhor5R5EUuDwWwC
igC8QX9otApyyzP14ewnO5PvOhL6fJO8XQSwz/Q0H7cj/Km7exGMKAW3bKPFmOkP
6A6BJXNUVUTGz8lCfjWUkEN0pomCjORtx93e4jDS4zStbtETvxjd1ADd+0yeRFe1
FUhTa4t6KZqGfme4YnFrRXu3JK4jJRzI+xDPqKObgTHZQ8sjCeDoi3zVkYBSoJb9
VvzaKBMvPAo3m01t0EZh/IT34zq0dxWLPL8cfX+FONANbR7s+zguec/DDpzzpPFD
BLs1BFcP1BkVQJmYAfS+s+6E6gEfPKFlc8OtJaeZhJOd6H3iirHQiD/xFB3loMfS
m45lbDTE+r6rNX766bMUmFbTF9a4OQbxVx7sBHlFrPUYQS3HV67euaaAjYYdpSPP
bDcDnAi7DoGNWazr1rC3bHZmnnlRObBCsxw4GiLFwfP0hCH9KuqgEBpU3IH7KQo7
RQnoef5ZGjFs2lKIFWBJ79gDblrL3DSafnNjAHwQdOD2EK2MyeNXggsvkMWkcOXC
V4HoRzPMRxoTcbPjbb0OTFkSOdIHk5Tbl5W2k5V+1dvWvYd7mokaq5RvY8MAaKf5
XnS44kqcP9o/dcJvhIq15tT3
=GiyS
-----END PGP SIGNATURE-----

--nextPartbapkTblkT9q_p2c-f6yx5A--




