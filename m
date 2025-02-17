Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB8AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBBGRVrDPOzL/cJXETAGl1eWZIx2QG5N8tUkdFnRiL0=; b=Csv+zuI7GZAa+weQ6F5aW6XQcx
	lFbuFE3GE1RQUzHqSfqIRgrKvupwq3N8a5QmoOR1kL0bPyuNnJPfyCJS6L0tOT9Gd+lUzriZ2hSgc
	/QVqku+3IzRLRwqzkkDxqxSlFf3ClegXvxEIAAlcH8m79JIy7xwQQS5P9KFZGZGQgqC9qCFu/jrPD
	/ZMKySrb9gSQbruq58zUgVJV5lKha4vlral6LOoDWlLSMHLYyaUZBTq0p+6yBfXXn8F2wuPRPqU3w
	yoFMR6hu3uFFVJRKjNZ9afTmeCyAXnsSkcrTnY09Wzp/eCxDXbqLeY5gWDWrvsJJdTg4fJN+/XXNZ
	w/mX/m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6qN-00000005lId-2TAB;
	Mon, 17 Feb 2025 19:31:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6om-00000005kxU-259G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:30:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso30827315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739820611; x=1740425411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBBGRVrDPOzL/cJXETAGl1eWZIx2QG5N8tUkdFnRiL0=;
        b=eRxkyOHkNOvCxSYqNNyuaN69ibTVlHjRny9sUn2oIE/f3nse8ZHU1DsnR+D6tpw778
         skFAi3pAEMsC05nxgXOx1bGuWnmdd4AYvvWx9QVFYyMTqvMR/x9l7gDK4JvN0tNDoMvj
         VZGLjKZSB9nrPYcRBGBeqRNhT+JrGZUcsxWGejjH2rhV9x56GMeNkz0FEAzPODSHHqWM
         T9JO9T+gnf37EMim1JLUfGAghjkJM3D36bBbzIC1ibkrQh0Du77VJHbRBkiaXP5B9Z5s
         H92B0Pww1UMcldMGDlQuGKC7b5dpTV+1g1Fmo8abk0zcBcAe/mvSFvm0uTSv5buBuhly
         LjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820611; x=1740425411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBBGRVrDPOzL/cJXETAGl1eWZIx2QG5N8tUkdFnRiL0=;
        b=Scj26TmvhyViJeq0DU7aWuNxmRj2QwXLMJI/bfuqMPsLCDgMLMRPrZA4Mu6GEWxsuN
         eVZ5W+VlCu+n2czVZLnVRqB3vma3YVr/xJQi1eMpROepS2d6LLt4xslemBtJ3a8CV0rz
         O4Rg4iFgfTA8UrJA+VXzFO6bapLtxR2ZU4krr8J7sBDtd1C3Y7z07upc5YwYIGj0BCAN
         nWewYrBMRt1iGzbSbM1AviLhNowmDiHrcuZHUv1GH73dQj/TlOD/+COWLT30fLDUYRpW
         lqOfakGf51a9IJN36vwxkxUfGKJr4x8oCW/vOQpLNRzyQlfZw7UKWEmHV541vQjj6N0k
         XdpA==
X-Forwarded-Encrypted: i=1; AJvYcCUb1FFboHNkrA/oQlzeabIUzhKs8Zlt+3gA030YOjAQeOkm25zMbHEYX8Q4L4sTVHNSHFimNVUGDxl8Q40ZE4O7@lists.infradead.org
X-Gm-Message-State: AOJu0YyVf9nucIhKz8US4eYHGwT/cBkA8dH+DPzQpZmfDCrhMMALE9bC
	KMxrbMYoGXRHYYXB66pc3QS27L3x3MKpvVfhmaxXLNU18owJa+oG
X-Gm-Gg: ASbGncssbOLMcSanxTFwHt7WlkPIWn/33LV73/wK9FORkLgiAKZ+vL7oaZ9+Btm0b8g
	NosiUqecSmE2E6dSCEtaYfvYJUJDCo8lnHFRIkc4y3Kkxx/yYMvwzFtQHzkKFNhFB02EFAIYWYg
	3pJQmmbfKG9NyUyjwAOKEGl740ghNnre2oapdfxkWtSfRN31tCJpyzgsxDSyQkXY5Rx3Y6LdyyE
	7IfAoCsjbU7812e/DkG72erNobcKOwkQbEsTJIQbBhCX5PJjBs2C8wYSfybOz9KB+xBI6R8wj1S
	j//mdwKbA3qqdQ==
X-Google-Smtp-Source: AGHT+IG/GTBYMutX0ifvnaDNTHsFLz/DL9WhNAt4ojV3o2SFm28L0BvhF5nSaoivdCJhJhpmzmztPw==
X-Received: by 2002:a05:600c:4f02:b0:439:930a:58aa with SMTP id 5b1f17b1804b1-439930a5aacmr1691095e9.0.1739820610515;
        Mon, 17 Feb 2025 11:30:10 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:bb08:332f:1cf1:cf5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858ec5fasm34378135e9.29.2025.02.17.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:30:10 -0800 (PST)
Date: Mon, 17 Feb 2025 20:30:08 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	broonie@kernel.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add
 Microphone Jack to sound card
Message-ID: <Z7OOQNnlGCAfWYws@eichest-laptop>
References: <20250217145744.179213-1-eichest@gmail.com>
 <20250217145744.179213-2-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-2-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_113012_536146_3D79F580 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, Feb 17, 2025 at 03:56:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

CC: Mark Brown <broonie@kernel.org>

