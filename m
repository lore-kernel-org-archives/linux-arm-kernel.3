Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F7C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWuva+yS1TaIijzyC+2mlVwhJ1Wvxg7k7qqP6DARP2A=; b=j75pKQHY9NTs1K85bdPNu6/Oqy
	j3E0fMnH8Y3JtFiQVrTA0qYNQb7gTDAmnym7jatwDaXmni4XpwqkAJDIICl16k+UuBQTrHxpTyqzf
	VdHLcEDzn4O03RxhOY41o2bBXtXFfYPEA6Ej9KzdZcpe5C8Q4M0a3MXHui5U7cpeSUQsiWnaWhF9e
	9wigD3zPPHsDFIQZdgY/nLEOOYZZHJglbk1pK/1DRU5bPUYdraKi/C+0lBSJ9Sb84HzeCjCqEDTQI
	igFElt3lD5CqxYQR4kOzC6DVNWig5xcqPLHw8LJfbHn+s95nzU5+GNN62Ecz/lcpZzMvlUslFaX3i
	T4XxCuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyeh-00000000SQJ-3MI7;
	Mon, 03 Aug 2026 19:48:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyee-00000000SP3-2Ful
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 19:48:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso26963795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786535; x=1786391335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWuva+yS1TaIijzyC+2mlVwhJ1Wvxg7k7qqP6DARP2A=;
        b=f7gSwWZ4sVKw/2RtTV3iHriP9rh7M14aud3q9wLUXcG5K1JZs+Ryb72h0di4mCv5j1
         Ik6hW0CB+RUyfdEbphCvvuVdTA96dYsOX1i7uWjmuhoitpxb2c/Vgiz4GEt55rPEKZyh
         vTWfbfReVZW1NdtfBZJScyszM179uOyjn+Ax0i5F9lijCrjvzewHilftuD3n4Z/d2EZt
         vw/rxvgbncksAv11ZAd/vZp8fiVg6Oh7KRU8py7+hE4j9liUDxSPPOvJheFfStFP7HOd
         DOqDLYx3jvKD6mY0Qiik6nmCSMffSZq2EYa3LfkBM72WO8UvKMjr4eIIkHxeSnHijHgw
         ztVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786535; x=1786391335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWuva+yS1TaIijzyC+2mlVwhJ1Wvxg7k7qqP6DARP2A=;
        b=VbifWTyt+exxoZAkiXW61MQGp9aIgoliF/7HnDKL4sbFRyTO0azFMBF63VHxVNXk12
         61uuP99HuAkq03FoMxVV20vLNHoRbY/FidxdfRY9bAnlX2lEHlMCfWnD/PRk8/svUbRQ
         13j3eARCoTWuSxlh90kvd91hR6PwLyiX2r+YRkj51Nm6SE2YB1+nHNrrHev+rXdID3cC
         +oAzNIa8xrI6EpzU/cbJOpDUq3bHvhXrGc3/1ULx6h9RCx32Ca4OlI+xvDjXvKo+y5pJ
         5fACTDgE3LtcHvEPlMkFxfX7pnhhW/LVFk3uW/hQ39rQx/CvAOzDsW8zZwjeZ3DrT9DL
         tUCg==
X-Forwarded-Encrypted: i=1; AHgh+RrjOAyXSeH6FwPwM7IxUS1T+w2pQKfxjKf0ZtJUIcaViBx3yf+ixkLftF0SahJIcVMnFPNlJodoAV+2CiC0DSL/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl7DfuTpVjezTxagnJ8OGe/iQtHfFWjZV7O1YTEkuPlBSW41OC
	mmjpiPOOtjpGRlQ/zG3Org3uRc4MS4saeDmiX9gu0S1vMEs9EXAr+N30
X-Gm-Gg: AR+sD11KqMvR03KHWNgdRYwtLeJWrnVhqv9iCO/nPU7oc2ufOk3+uc3rnFcXtzd3Bfl
	oeSnGyWud50bum+LWDW/UVU4M+YiOWAyHW78UP9nr5U0s5YaLU/P7JFjoF/lEMJ75a6wSkXdbKc
	C4GhqWqN3rNPUA8JuvjS0crAtOnAUY6tmBAJM6vQpZ2Pp412enYZmkMiR7H5lY+OPerJNfgyYoe
	E62gnLvMp+ONM8fEQkmHqboUqAW6AA3OvraUlWB94oj8sqZwHjPlfxKJT0ZQrhRNyBA72+OacVH
	NrIpxyW3EB7282hE7fVOFdHE8CiemBdRfexH8StK012T5tOP89XIQjJqf8E+Z0oqZ9yYyJHUGFQ
	GoNyz30xvyIBf5HpM1spS8VLWHTz6pWfRD+7KifOr/em6H4fb1B/nWqmZBAzAZiwA1XsQ/IXneH
	+/AJo0q619WuDJr39uTDIv6WcBuB7h8HNaz5Vvf10gjLEiMQkj
X-Received: by 2002:a05:600c:840f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-4980c6071c5mr221995145e9.0.1785786534376;
        Mon, 03 Aug 2026 12:48:54 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm33538389f8f.3.2026.08.03.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:48:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 3 Aug 2026 21:48:51 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
Message-ID: <anDwo-qXH6_W0_3n@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
 <amsuU7eXuoziObdh@krava>
 <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev>
 <am-sK_buCVI3khJv@krava>
 <6af761df-9abc-4854-971d-ca6e4ed7a2b7@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6af761df-9abc-4854-971d-ca6e4ed7a2b7@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_124856_608887_D886DF89 
X-CRM114-Status: GOOD (  13.74  )
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

On Mon, Aug 03, 2026 at 09:32:14AM +0800, Leon Hwang wrote:
> On 3/8/26 04:44, Jiri Olsa wrote:
> > On Fri, Jul 31, 2026 at 10:30:37AM +0800, Leon Hwang wrote:
> >> On 30/7/26 18:58, Jiri Olsa wrote:
> 
> [...]
> 
> >>
> >> Right.
> >>
> >> Pls see the sibling thread with Ihor. With in-range BPF trampoline
> >> allocation, the slow-path regression should mostly disappear.
> >>
> >> Let's continue the discussion in that thread.
> > 
> > please paste the link/subject for that thread
> > 
> 
> The link is
> https://lore.kernel.org/all/77edc25d-a521-4f65-84ed-dbb016593902@linux.dev/.

ugh I see, somehow I did not receive Ihor's email.. :\

thanks,
jirka

