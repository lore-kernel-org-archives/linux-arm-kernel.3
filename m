Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E782ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leua78RlXfOm5yDLa55yyb90IYdYDP2Cb4NE7P74U7E=; b=IeJoWaO8TeqskFuVL/mzK3Xpse
	DYL9Zgng8om12FaF/jnMC/OHiMSWjHBcfLTkS8sXgPtl7dN2nukOSDogT2VH5IoCAXW+IKk2aUhks
	p4tf419IX1O9FkBBGhQQE3eSt1eOI8WKRJzjIa95GVv4r0J+wm+ebp2RKs3z2XDaJ08Jqfte4teDN
	NO/Ampkoy5oYbnUiceoPTg+rJTWr+4ZR0TWBHBSw+03cAV5Y+auIQq1bibUhzApAbyo/oIEeQWgwb
	X8U72dyWAoidm26sfMq5AjfSzGpxfulhVCVH9o9JsQsH5Wi0nERsgChbXjK0ao2rqgE5wBG0b6eOf
	lcFUjp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGKI-00000004ZBH-2g06;
	Mon, 10 Nov 2025 01:04:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGKF-00000004ZAg-34yb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 01:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762736646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=leua78RlXfOm5yDLa55yyb90IYdYDP2Cb4NE7P74U7E=;
	b=BZ0wADb7+yYbVI/TipXIdt3cjv7Y1BDqRtsqbZGfOYMe/kAF4g5/kv7oG0rwAXbHgjveuV
	lS+lV20As+TmKI8/G7wCumtT42Uywa8K8SjyZmsOMieOrjQqQUNziUL7nNJtvQ2Sn1PX/t
	OWreLfOW3Y0yvvJbXZL8yLLgZdilEM4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-2bCLnKD4MvG2bljTRyxqUw-1; Sun, 09 Nov 2025 20:04:04 -0500
X-MC-Unique: 2bCLnKD4MvG2bljTRyxqUw-1
X-Mimecast-MFC-AGG-ID: 2bCLnKD4MvG2bljTRyxqUw_1762736644
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f7ca634bso18260715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 17:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762736643; x=1763341443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leua78RlXfOm5yDLa55yyb90IYdYDP2Cb4NE7P74U7E=;
        b=no1/hz/8BSdhs9svuvjBmIxBr3oXWMYAHene4GLVwxhyPnUNgFJoXHc85+J7LyrjFC
         X1XNT2Gyf+hAz52aBqtj7I4ZD9rUTVSXaBkOxYjHNlsiedhvbDZt8bQxsbQYVuvRAJvq
         9Uxw0efqLHvyHfEm2NCfjuFJps6XAUMoOAF9MkftKxghVZAjfk7SFksCLEBZlzscx71W
         nIukCpcDgvz6aDKZyoaVuSImHlpce4WOxg82ykOybvqSNoUWK4CBoQg5SQJlWfzHpUQE
         gaNaDjA4xX69AqtvS2MMUvKJ8DKkZaqJkcpdu54cqWs4VAlnGlBUp9gr8Tm7JxQIB6fS
         OkWg==
X-Forwarded-Encrypted: i=1; AJvYcCUEJTa7yyvREDvzI6z9L0p4+cfR+JekylUdUVouMJmSSy8JIPrTnGw963Fr5mc0GGK1Q8zZdG6vE6ayQEhcieBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7telU9a9DYaTNVeQsZh+fZFmhwk69Svy0ZlN1PFNjQQO4inq
	G067pQ+SPk7X8uHbeGqoZkA4P0IZvrKDDPkStr2FfB4OpKppoUwqeofaxqMzETmw+ERCuR0w4V9
	OabN++2LFTzlrYWy3WgH1O8kAwilt4wP4fd6UVSjek3itcTg+EgwLpuMXNhEA58GayBG+zdf50G
	KD
X-Gm-Gg: ASbGnctSh+6F8NKOQVhLl1/+PF+nM09SDzVHkwQ5yRQezPxij5x9Tn4ZVbrDWFCgTp0
	yWgga3MDvYgMzFwWvzn7plh7Lp1rgD+fEU1efAb8RlRLZ06qagDC14wvgqN5tFKOYbMU5d7xhpZ
	1TdBcBXVtLgZJ4CxvP8RwwRycEZTXyls1MA2F16oIdhxFSZF8bfTlcOCXrsa1Rji1DGc7j729er
	MQvUX9MEo8a+ZAO9JjahNkGdbab8PCgmywcfdWTz49veH8LK+T7Qmlvb5l2u/Zmfa8bKndgY42Q
	/KRN+rAIhwj6I1nioHBKBtNZ4sero7uh8hxvdBjcFpBTR3ZhgxZbZmQFxOY3Y5vaTwH/fEFQAEA
	bQiWSgfnBM39VdML5S1O5VaJ4O6Q+3q/7uLYn45M=
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr79634025ad.27.1762736643544;
        Sun, 09 Nov 2025 17:04:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaEQ8lrhTvJ73whBKPu8fioJhN253YclztyjeBunZlQDD4VtJSfb529w7R65ux2cszJp0SoQ==
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr79633775ad.27.1762736643128;
        Sun, 09 Nov 2025 17:04:03 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm126117355ad.43.2025.11.09.17.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 17:04:02 -0800 (PST)
Message-ID: <7e58eb4a-f8e4-41ea-a2fd-742e632c7deb@redhat.com>
Date: Mon, 10 Nov 2025 11:03:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/33] ACPI: Define acpi_put_table cleanup handler and
 acpi_get_table_ret() helper
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-9-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-9-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7QApi4Iigc--GfI2tDeqIQbxub2MQIxda-aXuHlwLjU_1762736644
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_170407_881712_B0E6FC6E 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> Define a cleanup helper for use with __free to release the acpi table when
> the pointer goes out of scope. Also, introduce the helper
> acpi_get_table_ret() to simplify a commonly used pattern involving
> acpi_get_table().
> 
> These are first used in a subsequent commit.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   include/linux/acpi.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


