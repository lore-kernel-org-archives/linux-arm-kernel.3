Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C370FC36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R5x+1WOSlr2ATn0vFw3CXpQGRrxOjJ4eIn39P6K6yc=; b=lAdxmFLhyfEVTnXkDFMuEU3VxK
	l1G/8waVzhHJNGDqJW8jeg00y3xDQZG5DHed8KCnVQZl4WmXWE+B5L/3Mx4ogH0le7+G7+r/Gzluh
	ueq28PAvxGYf92jeSCu6xXEAxwHON3WNJTp2GVu7AP8zw7+BtsO9crYSSoPno4igEk7MXYxv5Rum9
	/b+REd/ae75iaqvgJlSRyh/8sfhLcS5wMnU8IodFkCKqvgOcmqf1/jwKxYgUiiaZvFFqHWa6IieYx
	cfh/eOj2KFBcykvoknRLfSr6aZ+1ysQYaag5YF7UEl68xwfn5xnEW6mqJTum9lmTaBhKgi11ygFWR
	6NLaJ1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twahI-00000002Gmy-3oJA;
	Mon, 24 Mar 2025 05:50:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twafZ-00000002Gf2-1Qem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 05:48:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223fd89d036so71359545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 22:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795297; x=1743400097; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/R5x+1WOSlr2ATn0vFw3CXpQGRrxOjJ4eIn39P6K6yc=;
        b=SZPDc33MLeVEIdFWtm+TjaSk/XX+UWeXGEMGcIKvoB8n2nAcfr0A4jGGM12hzE3aPi
         FLY6+zjgmZtbxLjQFl9uSHQ4AP5pJHU+KoBIz6eM71StsD/vLhsLTGeSIHD3l+oV0FYO
         dJkMJ6+a27PF5aVLuIZNv4TfgA7bcJ2Vhe/ec7DqO/zoRean7XJrd27tTs1zPN41cnaE
         MmXqTCu2TvOqAwYKQ2bWWEI4B5psjg6r06ikynlQezoD3oLVcAT/Jm/FXgvm9ExDoBeq
         P75wylxTMVW0va7mEUwlfNBXhWtVQI/DR0x/QLFSmlCu/FxyR237d/Qlcbc/2FiPDsYy
         w9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795297; x=1743400097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R5x+1WOSlr2ATn0vFw3CXpQGRrxOjJ4eIn39P6K6yc=;
        b=W8YDycBCw3bg5KB8JWuBXSxFAj7Hwg/tfpiOFxAM6CPtPAvgukRqxpYndGe6YTAA1W
         HP8odrOPEeFwZDJi3ASHGtXN677oG69Krf5jh4yfGYrUNejIgj722omGjQel3Sp2Zfy1
         WperXxaf//sZ38owWleozo+KzQY0a8eLursW9bb4AOzNGOgEDt3QjwwfUIxXJGbMOTYV
         r3V2FVv4REIqSwC2+EzU9y9RQXBDtBTDfpyJRm5rOcIqlOU4B9XwjGUIMYlscIAIVZa7
         ZMIVg6VKeGmUH3g27MYyNDHZfu824EF0dHhex71At8LlEmXGxgL5Oq2joUoAi3Twq7Hj
         aVZA==
X-Forwarded-Encrypted: i=1; AJvYcCUhVUhjcsMjTVw7XeQ9n2HGuie/GBagZLZGz1imqhPZPRcm0YTPieSCqQdqh1NJ3dHm1tRVKwmopzmEMzFBkwNK@lists.infradead.org
X-Gm-Message-State: AOJu0YxD1du3o7N3RXrCsXlJLRIkpctw2F5zLcgAh+Lg18t+5MzQt8c4
	jjxARzptNg4H6ha2d3eweCv+RCltWkSnN6IWb3eoACI8q7OnWChgAvgG7g1R3M0=
X-Gm-Gg: ASbGncvziWVcseBdkRboZYIlaecsd+OG7rwGKW8gbAGr5IHu/9ftkwWyyzVbadqAoNy
	S5JYxvt2mDIcFLEwIvZxa4zrheBisZn509NKB5vfKjqQwKj5OqM03S3IDK3UWmvy6lsJaprQ4VR
	abzAXH+pFS4WjQsLKtO83SdiwO36Jp0IsSL3OYJ/49R9p93De7Vcgv8JaxsDEE5kkVnRzmRWMsR
	QXEz0gPTmV3LgnpBD5oxLHlmlsQUulDj+WFz/15qUxCl1YVTtNPXuoQdSY32jpCgShfNuYOJEHx
	SkYsNbFGsg5QcD0/2M1IzWrB+ZoP8vJsOrlOjUIDsjDAyA==
X-Google-Smtp-Source: AGHT+IEjzOfTYFKH7m9L7KhblERHs6U5SD2x2kJlkL36nq/EuBvZ3tJQu+dClNO0tHh2wUcONaNzMw==
X-Received: by 2002:a05:6a00:b4e:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73905a2300cmr18173268b3a.21.1742795296466;
        Sun, 23 Mar 2025 22:48:16 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906158ef2sm7170982b3a.141.2025.03.23.22.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:48:15 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:18:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <20250324054805.3x3nwl4vtvf63rwj@vireshk-i7>
References: <20250320155557.211211-1-andre.przywara@arm.com>
 <2772067.mvXUDI8C0e@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2772067.mvXUDI8C0e@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_224817_384043_9F90A380 
X-CRM114-Status: GOOD (  17.97  )
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

On 22-03-25, 08:38, Jernej Škrabec wrote:
> Dne četrtek, 20. marec 2025 ob 16:55:57 Srednjeevropski standardni čas je Andre Przywara napisal(a):
> > A KASAN enabled kernel reports an out-of-bounds access when handling the
> > nvmem cell in the sun50i cpufreq driver:
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in sun50i_cpufreq_nvmem_probe+0x180/0x3d4
> > Read of size 4 at addr ffff000006bf31e0 by task kworker/u16:1/38
> > 
> > This is because the DT specifies the nvmem cell as covering only two
> > bytes, but we use a u32 pointer to read the value. DTs for other SoCs
> > indeed specify 4 bytes, so we cannot just shorten the variable to a u16.
> > 
> > Fortunately nvmem_cell_read() allows to return the length of the nvmem
> > cell, in bytes, so we can use that information to only access the valid
> > portion of the data.
> > To cover multiple cell sizes, use memcpy() to copy the information into a
> > zeroed u32 buffer, then also make sure we always read the data in little
> > endian fashion, as this is how the data is stored in the SID efuses.
> > 
> > Fixes: 6cc4bcceff9a ("cpufreq: sun50i: Refactor speed bin decoding")
> > Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Thanks for fixing that!
> 
> Reviewed-by: Jernej Škrabec <jernej.skrabec@gmail.com>

Applied. Thanks.

-- 
viresh

