Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D146DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=; b=tfMfXqxFZ2s4oHXwj6EEXU5Udo
	5XeinbNahC9J9NdndaBhseqCuo8JNBZQIf9RcjK9KBXjNF2w9dLVbILpIV31ZMd2CTCpPxKkkm83k
	3XEkCKbjqkmd4u5mmk+MLNK8Px7x7p9MubjVfMCZdPu3RyC7jHWVKEM51b43Ifvpw2vCDcqEIQ5Mb
	4XunFK3Czd6uHAPL2WM0xzjTfE9IiM4leXu8qAkJuUj+8chsr0wx58jcETrBda7Smu2Vpsq6EoVme
	s0WQV62Auoz0T2FNnOcgKDXkntwbqC6TnWqSMBkl9bCWbOvE4pC4U1XXLMmYVz4CE/utxMCXHzti+
	4T+HOhxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoVG-00000003Y8m-2an2;
	Tue, 11 Feb 2025 11:32:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoTq-00000003Xy6-3m48
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739273464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
	b=FWrRX0SmdDzGc/FLo37O/Kv1uqj/TtZVseuOg1822C+Ap9yn/Y28qJLtqtX770UbWkUWzR
	YLbdDhvVMScl9e7QuBhJu4d2JFeHSRVu5VMSq4QuS7uA0D8uqtEgaV+en06Wpg1zxY0w9x
	aVAllel3CnMIBk+IsSMpmcJnwi3yTtM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-8-TUgVgmMDSIEEg4CVVKQw-1; Tue, 11 Feb 2025 06:31:02 -0500
X-MC-Unique: 8-TUgVgmMDSIEEg4CVVKQw-1
X-Mimecast-MFC-AGG-ID: 8-TUgVgmMDSIEEg4CVVKQw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dc88ed7e6so2886144f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 03:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273461; x=1739878261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
        b=NmWDxO8kRwx/YOjrL1AoSjPDB1NICVIvNifl5LIy1podEOvbpzVaBFxvqqlSpiqOzP
         ikfK5QyEZ3DQ5kuX6fmMnZ5vNqZFM9yVW9s5gg4q8Oig4Tu0LbK7lVjdtip7IRr+f+oz
         ZvHVXk1agWE+NOJ1SOFLFq+kv72ohUU6Jl5NuZ6RquZlAAAGiRz8Zj1uFSnYU5Q8ZIkb
         DRelBpK+avRh/asg4ic7ydfiYC2vISAKpJkc3G+1xkKSrMK7BivJedR/3Z6GYknh4k2P
         JhnY7LptBN2h4COTHn0dmEaUHyNN/tG/GLhVsP311ytWxVMrujdeql4xtWdv+6pO+IvL
         EISA==
X-Forwarded-Encrypted: i=1; AJvYcCUqThowfvoX/6hlAXX18fFH6Uew7SUo87DdsyVVo9pxgIgHjRJQZN7h4rIJ0ziWtktStHCRCBcHS5tZeVki6MDa@lists.infradead.org
X-Gm-Message-State: AOJu0YywtaXsvQf7ufbVhxINrxKN/kopBdb4S85Yb7rQWQBFU6YutETy
	dxlh2GMKMfVdQDDsrVFnJ0IFwfAXuupqfAMC+ccinCox/uU3Vlde6lYWsIBujnw3J6d8fUAtw73
	6zDN6G5tYRapo0DXYaTE4HPqV8WZNQnYCwZrAqEJnJ1lqOXIx/AXoq0NKLSVif8cljZQ8Bm3i
X-Gm-Gg: ASbGncuVMx/1NG5Dam6plQQ4yFYhdDghN50DwP2mSEJTnQ5WkWz86utnixUPg5PRqsX
	UMatZs4Sn39D+HA8yZ3O+8XmUDNlXk/oj/JrfY8J544LV6+tE8uqkA3rYFD+CthKt/MQTewgxZI
	rJm0AZu/ybPznihGMWOKVEJNIir6SLpVdDg4AF4MRSOCSe/DjonTiTiINTuEYL6H5B3l5tm9Nve
	TqUfnQ8ScL910rzjwXyFfXiR2JcM4h3Us9rxzuoZIzj0CbcMnIDLxkwe8kmP+lFX8tSSLrFR32y
	fA1WIEHypcZDD9cFXwKnCHucEeYtB6332Lg=
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802171f8f.55.1739273461486;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHayBvfNx73SbQMhbxNkafqfD+FDlmMiZt8eb9H+FDR01lT95RUPwq8zXQKROFW+H5GCWVS0g==
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802140f8f.55.1739273461119;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43941ddc8e9sm68421845e9.26.2025.02.11.03.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:30:59 -0800 (PST)
Message-ID: <6abfb27a-8116-4b15-9485-39e5b1f98c2f@redhat.com>
Date: Tue, 11 Feb 2025 12:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: refactor clock management in EQoS driver
To: Swathi K S <swathi.ks@samsung.com>, krzk@kernel.org, robh@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, treding@nvidia.com,
 Jisheng.Zhang@synaptics.com, ajayg@nvidia.com, Joao.Pinto@synopsys.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, linux-fsd@tesla.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 ssiddha@tesla.com, xiaolei.wang@windriver.co, si.yanteng@linux.dev,
 fancer.lancer@gmail.com, halaney@redhat.com, pankaj.dubey@samsung.com,
 ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20250207122130epcas5p1857043fa03e7356dc8783f43a95716ef@epcas5p1.samsung.com>
 <20250207121849.55815-1-swathi.ks@samsung.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250207121849.55815-1-swathi.ks@samsung.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3sL2QmaCBZUDFLT60dQb_aL0IPW87Y1OaYOpjZunAtY_1739273461
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033107_020994_9033B3A0 
X-CRM114-Status: UNSURE (   9.82  )
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

On 2/7/25 1:18 PM, Swathi K S wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

For unclear (to me) reasons, our CI failed to pick this patch. I guess
the too wide recipients list confused the CI, I suggest re-spinning
including only the ML reported by get_maintainers output and adding the
target tree ('net-next') in the subj prefix.

Thanks,

Paolo


