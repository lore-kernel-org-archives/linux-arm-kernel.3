Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7DDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=; b=06adWx7gj4I8fDBT9ADeGbJamC
	RyQ9t9831dSQ06zR4pEmrdyvI7BVibmyidhRUfAxVdhDJ6n12q8Rg2ga+5sajWPdCUvKZYXybDXhQ
	/Dyf8UQlKBxUFIjCp/2w0VHKDteczrseqNcPMdFfLkfmLWr1+03jo3xmFrtKozms6Di2XJu5BHAjN
	aZ4ae3BdjoYTFQj8NEOL1TAJglXyHCjiGmPbhnyaxxA8ooSjXVXFvEi2qtUvticm8t7J19KhNN6BQ
	mYRdvn7zWIL3nEIP1lqUw7GP6wt+E3XShh9FW1lnKmEdeh87KGZZKV4I29Ftkd2aTTIj5nHvPPlmq
	dsX2QUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuGa-0000000FCGe-1leR;
	Mon, 03 Feb 2025 11:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teu3W-0000000FA5e-2k4u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=; b=KTUrHVMXjRI3rvj73iA9x5Mk7k
	lNmc0uVsVeMP6+UfBfS7wXlJrLFAD39XYbO1e6dmVqaAgDiC9bEACZJnJY+VO7Z9uwjKWixYRZE4I
	SbJpE2W4NB2PHy3CWvzzza2SZdsknye0mrK98IE5iyyHk/dVM5+72o4+9um09h54199a8gxmOHJNy
	FhSdElJkB9+tnNehLBsg4lrnFx+IieqEtDgulKOcxAIB0Olp266UOsvDJrw+TnhRUSusoCqIo3lfT
	5dIMcuXQpuAVPUsN1y68ucv8Z6GyaMtV7e9elROYVROOANVEn3o+XAWrEj8ufmveJa/PYqukUtZPH
	zxrrY+sQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teu3T-0000000G4P2-31aA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:51:53 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166022c5caso62978965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 02:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738579909; x=1739184709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=;
        b=HfzfG1yIHzEsSFzRKm9QmfWHtyMfmTxyHQMkRmd67ptXk9SgPaTDsLoc0BAv51mswg
         uwi74gb5vw6ofZrXfGl6esJC3V/A5BzCGHF/miXrrv++8ZIkP06A7j8VvEAuuLVBJ0ky
         0LoyR96cc1H4sWNgYI2iMZm/fwmVVNDqJwAqjstVxLauRxpkgIPrACbOleQW4bcztC4P
         DeCGerzkkwTWDSaXxEJatnh1kQZeoF5sZPa7uzbGQ8+xl5VjW88tbKGWP3Sn9iElusEq
         8XxdoyYDgQe2mb8S7+/CUEFY4xHRFuMN6V3zchdfKONLXrrn+LfEOdBsZIjfC688u5EY
         CZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738579909; x=1739184709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=;
        b=n6h9L/q3FZhZ8oHaIQFxzhK7+ve7WFop1MhlxkVwEPUWYwePIFyW5kG9UpGgtyNX02
         02u3WPT7Mn/EclNQ3anAnKqPnGYNwWBLET8HEus7040g1TaOCO3Iv3iFJjiOvsyCnYx8
         sQN8hCXvJ53H/aPx2avm4KprDT+xhF411fb/TMwsow8jqE1Vx/sRwYBAfcO64aoYatkt
         qJk0tJtYR/I7+KUA3jE6h5qduQS+2Ic9AsYefynBrhbkBFs4xtu/XU9Y4toRjOlr/phC
         +VqkoYVl4TVJSwyYg/+YLJaFL7R6IIr59YdE7jSWrqkCCk4nosvIZEDKXY7ArQhSxExR
         1pRg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ad/tOi2SH61yAqP8A6ass/AI3fG/ZHf6momLM1uqeJwM80YN1wGt/RYbHGdt+XecRRcD4+C319OdtjtjF+EG@lists.infradead.org
X-Gm-Message-State: AOJu0YwXS3C8FMDQUXylzHADWnE4IQSPlhtk9yUvAsPz4oK6yGZGperz
	kn8a9+STU0siDlw84iwQDSJp5t7ygof8GJxMVaF7mExeHYIXIQGWumdEWWWW18hyu3KORp37Xys
	m
X-Gm-Gg: ASbGnctjuMzHaqlHahG6Rfmbqr3vqBaqzPubhr0ry13I81h66gIH6wVYPXVTJB21lSo
	GNfa5XGem1TdAOdj9atWDGYom9rm3Q93L2XMYQHSHWcloZtIUcpm8m+FyPpjoc7Gx5DPsOK/Ly5
	vimoxWBSlbMmHDI4fMqWTmPT7rVA+ao0maiaHVj8J+qJV4tdCkq4GJxaoOlTIlr2qeVFA6NLgZ0
	X6FfiL3dlMTmKUeBlY2Adr9A+oMZm6VQpCZkj4EiGDjjX8/1MuSjVllKcI2X5r29h6th56+CTbz
	sjdJErhSf4aty6OQrA==
X-Google-Smtp-Source: AGHT+IGxMLDlIMSaw3Z8cWeu4NnMK2JLensF+qmNnQk7oU5j+h5mOuW/KaB0EYuSyfJh18W/YDA4sw==
X-Received: by 2002:a05:6a20:9188:b0:1e8:b17a:a556 with SMTP id adf61e73a8af0-1ed7a5f9136mr35623177637.15.1738579908746;
        Mon, 03 Feb 2025 02:51:48 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a766sm8026943b3a.161.2025.02.03.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:51:48 -0800 (PST)
Date: Mon, 3 Feb 2025 16:21:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: zuoqian <zuoqian113@gmail.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <20250203105146.6yuzypgb65bu4xrq@vireshk-i7>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <20250125084950.1680-1-zuoqian113@gmail.com>
 <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_105151_896066_6F0ED93A 
X-CRM114-Status: GOOD (  14.66  )
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

On 25-01-25, 16:04, Dan Carpenter wrote:
> On Sat, Jan 25, 2025 at 08:49:49AM +0000, zuoqian wrote:
> > The CPU rate from clk_get_rate() may not be divisible by 1000
> > (e.g., 133333333). But the rate calculated from frequency(kHz) is
> > always divisible by 1000 (e.g., 133333000).
> > Comparing the rate causes a warning during CPU scaling:
> > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > When we choose to compare kHz here, the issue does not occur.
> > 
> > Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > ---
> > V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
> > update patch summary.
> 
> Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied. Thanks.

-- 
viresh

