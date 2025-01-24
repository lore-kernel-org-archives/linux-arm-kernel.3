Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E5C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7vWCF2quBGdrEvOfcwrCJ1ka96RD0NxHHiEml1rsAo=; b=o+8MDp4sbyg3ypavHeLEiwqoQE
	ovgSUKBX15iCTyIWj4ZaTaLqd4s0rMM703mo9X1AQhQznsZwps5i3rNUakFsn1LyqBoHtUKaz6IiN
	uQpIjy4ipgLUCw4jl99TEaGICkmqnLqjn539hc5HZEFvDgMPDoB8/VSQKUyS0VWeTD0N7ZLGOASQo
	9A5A+qd4o49a2Q5yfInAPJbSYieIoIITk38x+wE0YSlTMW9guIl90maRt5F+/JgjcHMSD2JR2uDC4
	/+/XnPIclYs+IVPA8HhqbVFpRADhb25dmzZ8qYPkkcLzxC8xpKXulFC5gyWxWjIqvlvMsHXXSQaQC
	00NQfGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbATG-0000000Doze-0P5S;
	Fri, 24 Jan 2025 03:35:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbARs-0000000DooL-3CLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:33:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so4538737a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689616; x=1738294416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7vWCF2quBGdrEvOfcwrCJ1ka96RD0NxHHiEml1rsAo=;
        b=BbyFHKl51YIwVTDg2wHmTvncmpv92IhUqTb+2zf+XlIlsFu4ZRVHnF4XbhQ46OJ/hg
         5z5KcDxNWuL7dLtgx9g7UjGEO0j2ThGmB1/Q7qLRTSkOOHYP8XsCZDHCFJZllytaFrUK
         Zr8G6TBe0EhYJiTMXPgFrFg36ARga/QQvFlnvCI1p4J3dXdj7exPDpyYIq4EE90Q1N70
         vZOz9z5sLGpglTAV6DFG+aj1BOgn7TrjVuWFrq11MKeFh9i9iZ3vR8bo4LziwVmAtf7o
         aZ3Pht37Uyq2My5Ln2UQ3DwEStWBR1I7jupxGc+8iHJbu1zkS1p9rbY8lZbt2H/iIhv2
         HYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689616; x=1738294416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7vWCF2quBGdrEvOfcwrCJ1ka96RD0NxHHiEml1rsAo=;
        b=g4XWx/GJP4kXZLSCkIpD7FlMH4iCSHst+7CYHqRygoc3QEJ1lMkEJWFqpyhI93tbTs
         Q16AX27mokMOA3GyMdGtMSW/HViczyA2QT6wtB747xjDll3tQrNOmq7IlgWQ5gNO+5ur
         82rD77ONRwU9nsOB6yUjP3g/FvbKzs76vTmRKk/KLeWB/k8IICwrBUKshuTfa7y4U2DH
         6xgcU8YZVk6HhC6GsxYDEyiPPRzFw4g1kdRmHNeQTTzFFmqQGAiMOkqaM/NswfnGizeD
         R9McBH8Ry96uzkmlAFKILhadVfS626UTWR2vJUrupfcOCEaVOgth766qb1/dyKddg5ji
         M+8w==
X-Forwarded-Encrypted: i=1; AJvYcCXeVfunOQVlsoq4milCuzk4uutOtKzKlsHJAN9Xsx7E7yJrP3bu/zb+aq34DKfR3RyV+ZNXmEolXvGwinCZvaY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SQ18PeI1UDskxhALczHUkkNhfhD2w6GXFAp0Zvpmy1WnuYqn
	T1qXcaQH+ZcW+bs2hyapScB+QeC0dkjOzyCraBjcl86GNUHJd8sLNVuvCw2y/+c=
X-Gm-Gg: ASbGncu2ViqoxrZOPM+Y96xP+cO2M8iQNnnmT+SLAXZGKOE2QAkIRPEv0+AKdtPfLBE
	093SP8gie4uu0CZbouYCfGXsSvv3/T9DaPfj6hY2qkQv0KmIhlhT3MRT7B9VHR4tjJNo+Vc2FqG
	hOlXHToWxr+8Dux19Os9FpD1YSYLqt55raK8hEoQb0l+3PQuFn9L9o6YoTT9fI4WiDDig5aaPM8
	zK9d03kI9iTuSu2wbMNLkMfpQDDN2nz7C77bvxHXqlafGvb10EDe2xHOopW7GwtCh0OdXk59zQx
	1MjCNccpwGatUd7TRA==
X-Google-Smtp-Source: AGHT+IEu471jFc6XUwYmJu7IFl72PwG7UAxtkv+mCyC3gGiPN1kcxEs1Hi626diqb40sAHktXiT8Kw==
X-Received: by 2002:a17:90b:2542:b0:2ee:5a82:433a with SMTP id 98e67ed59e1d1-2f7f1799756mr9182783a91.17.1737689615710;
        Thu, 23 Jan 2025 19:33:35 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ff959309sm542317a91.0.2025.01.23.19.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:33:35 -0800 (PST)
Date: Fri, 24 Jan 2025 09:03:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250124033333.jrqbhuyd6qtogn2c@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
 <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
 <Z4-52JUmR7A-7NJP@arm.com>
 <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
 <Z5K4aDaZIbhRCbOP@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5K4aDaZIbhRCbOP@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_193336_812419_EA173209 
X-CRM114-Status: GOOD (  11.01  )
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

On 23-01-25, 22:45, Beata Michalska wrote:
> That would mean we are opting for presenting '0' value (whatever that means)
> instead of trying alternative ways of getting 'current' frequency ?
> This is still the scaling_cur_freq.

A return value of 0 should typically mean something went wrong
somewhere and didn't return the right value to us.

- For the print message, I think we should just print the value
  instead of UNKNOWN. Let the user / developer decide what to do with
  it.

- As for trying other mechanism to find the frequency now, maybe you
  are right and looking for an alternate way is the right way to go.
  And that would be consistent with existing behavior too.

-- 
viresh

