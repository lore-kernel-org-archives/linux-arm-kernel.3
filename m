Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3530CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WMhFn1C+Yx6W2wpeHv5vlp4fLrLgkTAzBM0vbXLgCo=; b=1WV1AzNAriVXkf9Sya6Bh90Odx
	K4DVj+ffDilly+gmDSysaHH/Jsbmv11QPU8rR9GMyg18RJpADDzCSKAyesI7361Z+WIwKHI+5n/LW
	FQO2YtoS6BzDgqZME16D+OtEGwVycqNy0rV07s/twFvccamR/0EisrUwQO3aEH89aQhhW0ZhhRQh1
	fWvHJaTrdbFwfcvBcLe3Uqpe/vN+F2KJvP14qpoTxJ97yk9m/Sdlrg71pa3IAecDUQ+vEFEb+nX2l
	U3el/5HFs9+8/9rQ56IBpuHguVd/sWthPk1Juuw5z5+/3bWxj+tFA95iPOTq9FYYrGcXhg2FESWpO
	cQ4ejgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xv-00000008qpK-1DQq;
	Tue, 09 Sep 2025 17:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxBC-00000006yh6-0ELn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 12:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6WMhFn1C+Yx6W2wpeHv5vlp4fLrLgkTAzBM0vbXLgCo=; b=BwcDnROanzLMMhTC+4G15M329S
	Zklt3PDQc/OSQH4Ec1t6LuYYYo1rfBCZ+KUJPfmD96U98auy5KmUvLAPXgtgfEzOZBp4ZEcRjj6d8
	u0cijOUDbRuOBJ5LiBDLlYhH5wjesbB/BRU/8ZXiaF6BLmUDB45GXN4DaoGP+MVO+c2vh1vpIfQw+
	qlARN/ojwfV2ynpcJ24wYDeI86ThSI9Wmeoj9UwDB8jD8wXCrZNUj16AxobF5jjrL2igVE0+vJZhS
	WPomVmleSf/rKmno5WLVbTZC1+lcFsZziLrtZxyVPmzfky7RfQ/Kc97GR86lKkcWiQfOTedPbJ7b3
	/YMa1DjQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxB9-00000005Lvx-1CSM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:10:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso27811415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757419829; x=1758024629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WMhFn1C+Yx6W2wpeHv5vlp4fLrLgkTAzBM0vbXLgCo=;
        b=UWHnfAPK2+h0XpHo/lfvdQESUhwsWciOFf6Hc7J41VZm0jmsux2Y8lQhM8G4++sU3n
         u9+5K7Wbsicwoq3WGZREi2JifzqvS/bu0+4FpC4faRKaYfuZFW3y07/cpcUsck53I66X
         AWn+efIPqFil2vPJcVzx/i4MeNFPQpgurP7nCnu+LAWpqsNGleEInEIpqIi5wdNQRPiS
         GDzBnPMyOvyTg/LcMNdT9vwsh6WRlIl3S0XqVUQR2Fzw41gLt9YhzFBCZrUIjqSe9BgQ
         7WyQOB20q/Zgxh3W4fVd5TH5ZEAaCY6SmKuD5rTI9EE2N9CRjpWFl6MGwj+7VlhKP5ns
         AwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419829; x=1758024629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WMhFn1C+Yx6W2wpeHv5vlp4fLrLgkTAzBM0vbXLgCo=;
        b=wHom3iFHugZ5DcEf+eoDefzyTb80w8KHSaTBJdJS+l4im3AMROZbcF2apM/nKGx7OH
         MkNt+VGxeY9MaiEQMR+UhbvpVxGuSYzP631am8K5v0YQxQbh3bCdPqHgCtb4/MQnfFfw
         hnUcThH0D5yHZpPzWtsW9/z+qsslVujpUx8zjnN+iZIQ9weFxmBwEUwOoIvcMFJeeJDw
         q4U1gsWvIf3sxn7qft8/uxAAJIsb+SYuSMGialjrAAtMjXmnfDGOZEgcuKtdkKwCCdyQ
         LUe1uBhY1mKbRu0/epyN1inDEDzjK/l8wvE5kCHYZKvJ8mKidB3E0Qv5SBscOgUNZhaU
         hYQA==
X-Forwarded-Encrypted: i=1; AJvYcCVsJy7cplcd8quYhv/uUA1UfEJmgtQjmqxK6MfaSdk1RJXShv19kuG0XHYFRJktDK9wE+HymVDUJgp/IKU+d7+J@lists.infradead.org
X-Gm-Message-State: AOJu0YzzEkP+5dZcBVntiD0uRBVSfA/pV31sVaiMiTEhn7GyUtiXAU9W
	j2CYpHWf7DGfw+ySnjnAL2AsLTa6QIZY1SvvXnERomn7+rF+m3YVgzepT5wGL0w9wQ==
X-Gm-Gg: ASbGncuu8DE9aQvDSc8SvtSvOuJ6ZNcxEosyHZ1fgbnovVia5XpIUrqgEQ3hEFPb7ZQ
	lo9A4orTgdVLYaVy+cC/i64egF+ODHHk87Z9C57o83xQbJRfOLkDVjw017gNw/OZNmRFrYDoh+S
	1b/s90PcpRig0KaDq5XnfAFaWKlIXfl4I3DBcIjrAbeYS0QmGUFnuZmPF9N/DMEQ15g6ecjUkrA
	jl4oeOdkLkmtnUhah/BGJppc/JlIQT/xYCyjv9K/R6oV00nCjRkKNxz7YXLUfVsh/zKX/IXseOl
	bW3uqEmz1WM70j4FaEUllAFHRFNJ6ON2nMdvBV8seLhc+TTJkp4d+7zjRfzPrqG028wv1hFNwXL
	UsDPuKR1puHzJ3dry2tg+ZOtAYed5SFae2zvFr9u1jK7dtllP03xg05UQinwntU37OTPP0w==
X-Google-Smtp-Source: AGHT+IEC0Y6r4tWAAX1HWCsbBwXYE/aB19u5wg0kytabUISZq9YPIfqob+aeZg0wKmLtsUPhiNDWVA==
X-Received: by 2002:a5d:61c5:0:b0:3e7:17d4:38ad with SMTP id ffacd0b85a97d-3e717d43c09mr7390502f8f.55.1757419828720;
        Tue, 09 Sep 2025 05:10:28 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm234800165e9.7.2025.09.09.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:10:28 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:10:25 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <aMAZMaZJ1_Eny5Ku@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-5-vdonnefort@google.com>
 <20250908193757.079aae76@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193757.079aae76@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_131031_418231_7EECC8A0 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, Sep 08, 2025 at 07:37:57PM -0400, Steven Rostedt wrote:
> On Thu, 21 Aug 2025 09:13:52 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > @@ -400,7 +436,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
> >  	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
> >  			       &buffer_size_kb_fops) ||
> >  	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
> > -			       &trace_pipe_fops))
> > +			       &trace_pipe_fops) ||
> > +	    !trace_create_file("trace", 0200, remote_d, remote,
> > +			       &trace_fops))
> >  		goto err;
> >  
> >  	percpu_d = tracefs_create_dir("per_cpu", remote_d);
> > @@ -422,7 +460,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
> >  		}
> >  
> >  		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
> > -					   &trace_pipe_fops))
> > +					   &trace_pipe_fops) ||
> > +		    !trace_create_cpu_file("trace", 0200, cpu_d, remote, cpu,
> > +					   &trace_fops))
> >  			goto err;
> >  	}
> 
> I wonder if we should name the file "reset" to not be confusing to users
> when they cat the file and it doesn't produce any output.

My idea was to keep the exact same interface as the rest of the tracing. I could
keep that /trace file for compatibility and add /reset?

"cat trace" could also just returns a text like *** not supported *** ?

> 
> -- Steve

