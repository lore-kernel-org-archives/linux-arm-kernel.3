Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F7CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmRC4hX1HkUO2ejwd5/7P2ssChMP4j4+YtVG78yP6GQ=; b=kSYsSb4uboGKASd2cOk4RdyjtT
	PfvTVGTcIqqLjbXmu7STHv4GtTCtxfX5q9Bgq33NQuiwTNY1Iobh0kaNFItxPR4g1AuZRdLmgS00f
	rGCdaTllTscgNA/CKmIvcvP6BuN8xzET8JUPA/X94J+vAVF5wrWzLQmp4et/spbo+ZyPA2tQYzbPm
	aKDKM0XbeKf+x5nWZnxZkLszN4FkCpQAz4nxmTsfNh6bB+Wu8d1jNovH7SrLquSfseT2uLAPEkQE5
	Y2rKSKBZIGn7JGHPU+bkrrjx8NXfzHsxvYAU9rm3cPvstPbOvgBv4wjAficxNDt63dmsJwnTmzcZr
	8QsYQBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfT1-0000000G6mo-336I;
	Mon, 05 Oct 2026 09:58:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfSy-0000000G6mF-1aob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:58:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso9281515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194318; x=1791799118; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmRC4hX1HkUO2ejwd5/7P2ssChMP4j4+YtVG78yP6GQ=;
        b=AUGr/K45ITcCmxj/biKUOmEjzshak4wRaUBITU9UhqZl9POwPo6rC2onl2Yf8xor+m
         5vqvvatVpxoeFOXxJNofvPBX5KvUMYibZsPUxvTnzgQ7pHH3nRa4p0Qv7x0xbrddfFwj
         mGVgZOqJW3c/Q3czs6R/xxzYqwjQjKXsuVrWJaOnadkmvLcnuRzRYQgfSO8aFfcL09WN
         5RZIS6ZvlVaF7k0j4G2kmfauy1ZYlb0ReqXvK2mmT33yFRbGLwR+73T9ZFSh5E8CAVfs
         KF7hmkDFhFlnqg7oek69uHdOjm9b/mpY03i1q2sbbe2ZWkDAdrfXljQIkW06nRtLR9sq
         KGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194318; x=1791799118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmRC4hX1HkUO2ejwd5/7P2ssChMP4j4+YtVG78yP6GQ=;
        b=T6bo+rlORqvUBrR33AE7z3m7d7MMEZVYYQZkCwleauKo1oEvjTqIwCcoQe9GazMEDu
         vAJyAgF71VzBmQG19dREXokYRieByr5UQCf7oFGAaQ4FJ3Jbyouialwv5ZB5dUqgcGRo
         6b6V60f1oyjd1Y3oDO5XL/c9R8eb2hJJ75GPzjHRa7a3NrY9Jna6Nd1JjjczSxDor5lj
         PD5xWXHkvhyE43HQsGI9+VMwnbqIf3nuR6YYSGH2ImcshA24gDhhrBWJOXJRJNazpm+b
         6hrlDN7I7Pq9tHGMgYEztG4vYP1bGbukdUy4BKLz6qF8oC6150cx07bjvbm6OCKOrUA8
         1/wA==
X-Forwarded-Encrypted: i=1; AKwUvBx+JsGukFlATAI5SKxnChEXw1M2FuwxUJW0wodzF2TyMLyC2Lk6tYQghplVdM1HIHjoMuMJtzMRs6ntQ1gHoKvv@lists.infradead.org
X-Gm-Message-State: AFuF++n1w1hy0Ss0HxZoM4QVKJYh5xyo5hPZdbMa7y4oZGyn9J/5CJKL
	V4j4U1Gcx8ZkoRL0Qn2NoxYztxh63YKHxMmHJpawrQO+NQRnxUsc+OGq
X-Gm-Gg: AYBFou1tSxyOKG4A1MXWt8iXJtpmReRZKnKtmG0VeTGHQ7xydjb6CvBwhLXxTAS3lcl
	uSWt2ikRyYSdjESdSnpvisvyasEk/sxIqtRudnShqQjfxKMvAlgKOeKM0LEPM7t8mpOCnmtTAyA
	SD7f6bbKA2HgJ10SESaZzQZqqXHM2q9o6njcVcd7vM6TP7bxHf+22l8/v+5054yCOQ38LQouoUE
	0JsaKBxhFrA+oFVi/0fa2iLDf39s/I8VqYPEkzjkvEdZGe+MMj4o3885bvNRkWM9lE8EAg70E2D
	u9PwD2WW7bv2Ti88QsR+bpeuTof+CJrUBb0SlVz08gFNBhZ5kOheT5IQTKegd50m0G8BeQ35RCl
	iGZMLVx5LFhIz2+3Fi+IRebceAEkgBwvN0kWH7Ryrd4aJ5B0jBWmct6vlbJAcCSkHqUG0bF+geA
	/JACj1P8cvhPeV2PXatcI6TFMOAqcD98IYRPAeMSX9KxaYWto+yg1JbwI5ozLnYX9xs1I2kXpdP
	kAq+dBc/ycUjYJdJLTmFFIL7zWXZb8OfHOn6Dzo3EHR+AFinYoVmxGDwXvzSSBg3RHFh9S6pU9M
	lFj/UfFBI6nJCyAWFBqtg1FkvAvk2FO8Tvw7ypx7ZCElMJQPO46YyWv2sTHDia0OQT+saIVTFWy
	C6U20//BbozpjkEBp2y2cgOpqoH9ED75WgcMO2SYOD+MJAPsRYiw/53tJoiuu5igHIPPmMe6KhV
	HVHENH
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr102508015e9.10.1791194317881;
        Mon, 05 Oct 2026 02:58:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c621e4966sm2518880f8f.6.2026.10.05.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:58:37 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:58:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>
Subject: Re: [PATCH v4 00/15] iio: adc: xilinx-xadc: Add I2C interface
 support for System Management Wizard
Message-ID: <20261005115833.00007cd3@gmail.com>
In-Reply-To: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025840_445886_BA3D15A0 
X-CRM114-Status: GOOD (  17.33  )
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

On Mon, 5 Oct 2026 15:11:50 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> The existing driver only supported AXI memory-mapped access to the System
> Management Wizard IP. This series extends the driver to support I2C-based
> access, which is particularly useful for System Controller usecases.
> 
> Key Changes:
> - Split the xilinx-xadc-core.c file into two files(xilinx-xadc-core.c and
>   xilinx-xadc-platform.c)
> - Add required helper functions and callbacks
> - Add channel configuration via callback mechanism
> - New I2C driver for UltraScale+ System Management Wizard for basic
>   voltage and temperature monitoring
> 
> Note: We are working on x86 platform support where fixed channel
> configuration is used(no DT support). The .setup_channels() function
> pointer introduced in patch 2/4 enables different channel configuration
> approaches for various platforms.
> 
> This series was originally posted by Sai Krishna Potthuri.
> 
> Link:https://lore.kernel.org/all/20260323074505.3853353-1-sai.krishna.potthuri@amd.com/
> 
> I will be maintaining the series going forward and posting updated
> revisions.
> 

Unfortunately you didn't specify a base commit, so Sashiko won't be able
to review this series.

-- 
Kind regards,
Joshua Crofts

