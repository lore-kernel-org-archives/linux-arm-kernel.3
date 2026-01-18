Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04757C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7eq9NZWv+jfQYvwT7GWinc/1t08cW4LlGcRYfwgt1M=; b=fyAcbt/QEGvSTdp9slEg8kOwP3
	j3Webtzfh+waOpqptUFgbhkg6TFA3FwDh+1IN6kMZZtIhf/PZrMQiK7e+xqj0cjA1IykoLHWHXXNP
	u+0FL6bzsCbfefl83pn/ZkusLOkWFQ8F3LpPbtrOwYNlmaSqsLpNhfO6KH1ByheXXnUh1N7acvWoo
	3EuHsFTU35G4H5jpXQk1aqYJoldk+naaU03l6fmh01OVU6P5okalb2sBajyJE84NaQJXPEATHY7JG
	V4rMRUi9owBEAKfh0dP78xUO+ukahqNip6gf9hfiYQM3zGby+MIoQhq2Vp5/jJyKG8NtUvh7hI0Mz
	QGcTtrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYFW-00000000mto-0cJ1;
	Sun, 18 Jan 2026 19:15:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYFT-00000000msw-2zHR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 19:15:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1956756f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768763741; x=1769368541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7eq9NZWv+jfQYvwT7GWinc/1t08cW4LlGcRYfwgt1M=;
        b=GqyYHaPe42rty5eTU4X7AXCgzA+qogGHOKcbGI5XROqaH2i3ZFtmXo2gZZygniSia6
         49XN1B9HaEqN/D8oC4+0TMChhVqp2Xpivyq772GU6hOsk/MNHC2NhF3VrkrvoJdLRfMq
         RxW2b7NN4FleXoPeaH+OjA30yUfX53J9YPv+15buDOhxfxQrcTlVcr3nirg4H82vXvqc
         yWE6UdKMDK8RWAJzZhpyGsSrVMhnJMolMuh16e9pMJHa5XZOi63EEdJUVoOLDzfV8cbC
         sEXjwIIKlev8FM6pQqkJgxJS15Z2VbHA6jU7iaMfZRlpSMtfC+0Z7Qbsr5qSW/SZTjbV
         bebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768763741; x=1769368541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7eq9NZWv+jfQYvwT7GWinc/1t08cW4LlGcRYfwgt1M=;
        b=Lr2BiXhNiR7RkoYmv5xF5V+xmdXdZTS6MrEtOSOMy+qNcpzRlmhVWlvwsTzp1BaI/q
         0xtGmIWouR5zvplLgBB4F84kK5LZfJAPNP13mZkcheENwM7tfcdlvhtQCAPLjgdykFpF
         qgAfKsivn0VV5Wv6cUYYyiomAyLX85aR1FGaUW9e29mxZ0TqIvIImGGrrI/IiBuQH9ZY
         yVygFdd+8mokivY2+9p06NIineIPaZUiLGifu5wXB8yOLe7wfX8jInChn0WnmvC8ifUI
         Vk+XXv2RnxZhb6NkIZoJ63PJcBbuWOcnU1iintBdWOtT0GWcclDahVcJoRlpISJwvnQs
         TC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzHNb0j7EFVHtVR2eov9XT82Ieew74ayDI+GRyk+ziuqRHdUJUYq3ZICrjgNDUlMDbzBhAVP0AVrGcLIFrkOyw@lists.infradead.org
X-Gm-Message-State: AOJu0YzaeUCOdszjx41WOCcqC8mmjKTMFjnZ0jgQTOm8Bbl2poRWei7g
	pDb+2UTa2cUJHe8t3HzgzPvwyJXIzAL4eJgrNe3jAQ7PdF9dZKFBiEbnHUSam81Zi7c=
X-Gm-Gg: AY/fxX4HC9NI4n9llxa0BPgThqbO0Rgid3gGqh7VPea7lRzwCzeABORzUcWMLL9VASk
	IXf0sTbHbuTSvFch8UIN86aePTE0MADNz2RcFFqBKDLErNVB+ArCEZy6R+cIJsgvVrsYIUGnAV8
	syQjWCvKm0FodF4E0atC5fw3m7WS0wCGBNg6ZGXs22LOsOYzQG0yfTRdzugcWmgxLPw+R1Djvk4
	9kMHKLc7UhPZT1U2u8rGW4uIeroZ9KTF9Plde48TGxeghCHM9Xk+976XWOqlXydKy6HchAWBSI3
	e5iw/lL6+zvy3Nq69Pxz+S9gBLmrDMnejCu7opNIcdk7FYVcFgrcXiL4zUZYOj6t2hn7ZtZ/rRk
	oKcQL7ABQ8TKB1a94cgUvW7cd8H+Xa9UObJBuzkFwnnyPKju563hlM0s27tAxs/jXI/KvfX8dTT
	R6hKuvW8lvjL9oIk7d
X-Received: by 2002:a05:600c:4fd2:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-4801e34c9b4mr122573745e9.26.1768763741271;
        Sun, 18 Jan 2026 11:15:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm158279375e9.14.2026.01.18.11.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:15:40 -0800 (PST)
Date: Sun, 18 Jan 2026 22:15:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Gu <gu_0233@qq.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aW0xWZ-KylipPF7M@stanley.mountain>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_111543_777136_3E27E520 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In scpi_dev_domain_id, it does not release the reference.
> 
> Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
> 

nit: delete the blank line after the Fixes tag.

> Signed-off-by: Felix Gu <gu_0233@qq.com>

Did you find this issue just by reviewing the code?  I read the comments
and then looked at a sample of four other callers and none of them
called of_node_put().  So it's a weird thing.  If this is really the rule
then we should have a static checker heuristic to enforce it.

regards,
dan carpenter


