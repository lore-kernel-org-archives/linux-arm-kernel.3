Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=; b=spKP/J7+vzKER7BIW9z5UIrEiR
	s70CAPMtbI5l0V+jOwio5eEDlanflk7eKUrhotmBkBOJ+jpcuQy1m56H2PyKQIxuEpMh1qNvK0DiA
	/Zf9dZfo2vZlV3uUHKHdsydqTQ/6mZsSW4q2ir0NCodzXS4QQvsvEZA8UH/duNQnx6f/GRyXWi/LE
	BcCM4VRQw7Fm/na+FpSTQsvvH/DtO+gkoKFS//CQJws5EmAQ1B3w5jYKJdDFr5i/I9wGADUdasS80
	MTgW8yIwrulHXypdF38RV/4bJDMnLmtBDbwmyIYvmv2kvpXMujLDXGXR37SHmDy6PivoGBN6EYHkG
	/BOCnnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRT3j-00000006qZa-18vI;
	Tue, 17 Jun 2025 09:56:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSku-00000006mbM-1MX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
	b=C6L44K+vYdCV4/wI/vb60z0usDouPyr6H6RyMXE22+hLj0+Z20o4ArXVc01cUuo3oSiysn
	yEE+kq0JuCeJ+rg3D3KXhvrBHc0Vm9K6xDYzvtHl+TsJ5kdrJBXJzfDxVhizpXt24jhwb/
	j5T8lwD46P9pQnB++RIDADmyzAH/NS8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-lvuWcqjbNTOSP2RSHLCn-Q-1; Tue, 17 Jun 2025 05:37:21 -0400
X-MC-Unique: lvuWcqjbNTOSP2RSHLCn-Q-1
X-Mimecast-MFC-AGG-ID: lvuWcqjbNTOSP2RSHLCn-Q_1750153040
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a58939191eso189876f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153039; x=1750757839;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
        b=LQhwvTRF/mmHWWzHrx2amkaDpAdyKJNGfLFKT8fCPYFz5JPnpk/AVv6/GU8aV+AA3x
         9tRW5J1NaAzUDqVGxWPfz04SZQGJGNMOb2xPNHRzfPhcVVv/U96rBAwmF6u8rbAA8Dy2
         eJ29s0chkq82C5txaTJJCNQ+K4MdoI8eSsqfAxxruXtLa7ZrPiFMKn1LnE86FkgPaiW9
         9heP/Lx+iD31kBfQ9YZbVlsDTdssXKGr/j0FRXMW0FDlKH/Imb6FSHc8MI+GH6IJTLfK
         TUiJgSxpCguptV/OKHxsATQs/LnGe612imcFHLIQrCpBO3kLDDN/Uh7tJoPzWoobV40l
         n+tA==
X-Forwarded-Encrypted: i=1; AJvYcCU+WxOiVxBpnm16M8IQzvdIUoqeNzbn1XcrXD/IU/lrKTe6rAIXX3qQSZsMmxANf9bLAL72dKfkXXjwIWbpFaa5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2fgclZCUrrGaBITGH+UP9krkwgGMVTNF5hWiCU4MoEwSW0Opb
	+VfJ007Gg56kdQZoPXZ1ZmjLMPVpTqPkIq6mu9zDdt4uAskvD7Y5o4A/ocvughC3MsCVwX2XIXC
	kfw7admGWTTSRWDFPQK6SWEGq/InKmJMQAP4qZy5Fmqebol8lZSw5WMjCWQJOcZBVqjrBs271E/
	cl
X-Gm-Gg: ASbGnctIvjj/8omUKVGlMlP8VWbka6IMPDIWscQquu5WTE5pLCdB5ifY4/2Dq7HJEDK
	BS80CrAabPsYgaOQrFEr6EZZkq6TRJ6xy/pNPWDi4HowmyFF4bwa/4lqNrSvnXlH625jcwsG6QT
	D7VOfm0T7bkvLBXHXwtZpVDwOBB1+6APNc3f3LyCZNIhtAITDOinpqiF5uZSXdIZKnaONPFbdg7
	R7Qcc7ER+50TR1eyAE+CcLIvJ++w6v4chtaQjav0rRWrxbtAtb9bXpJajDzNn0jtVgNQJDgYyOd
	1RfLaqFvnlGaCoHYQfBKzz2d7T+YaRs3I4kyS1e0lKijnlgoHxm0zQOdr92ldXcPucqrSWlW7u4
	PS38NSNq324F664ACOEIiCc6UG80N90lNoX51E7MZ6knpMqE=
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a572398cecmr9501300f8f.11.1750153039523;
        Tue, 17 Jun 2025 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn0r2S94rVo2KuanbuIlCONOQLmf7OLS7ZUZs7agOAWDn3Sa7W8ftax638hwNbov3D5qaGyQ==
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a572398cecmr9501261f8f.11.1750153038988;
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm175838425e9.7.2025.06.17.02.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Message-ID: <d9fc2e4f-3a4d-4bf2-9a45-b4d890f2b0d8@redhat.com>
Date: Tue, 17 Jun 2025 11:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] fs/dax: Remove FS_DAX_LIMITED config option
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EY21Rz5WdIO6CpvC3WRJcZfKSDOM1O0vT5Coh4dmgK8_1750153040
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023724_431447_DE3A35CE 
X-CRM114-Status: UNSURE (   7.50  )
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

On 16.06.25 13:58, Alistair Popple wrote:
> The dcssblk driver was the last user of FS_DAX_LIMITED. That was marked
> broken by 653d7825c149 ("dcssblk: mark DAX broken, remove FS_DAX_LIMITED
> support") to allow removal of PFN_SPECIAL. However the FS_DAX_LIMITED
> config option itself was not removed, so do that now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


