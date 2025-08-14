Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C483CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaSYWXyGxJ/9XhopS6Hw1gTGGNBA7I4gi0bSsDYE9rU=; b=ei9T/POkWvYcOXBbe1cygdfWC0
	f7VBjsbEeETQlntsTWSSbJyD1AxPZv+6Zi3WHn6g4CSugiG2+BkcN7kF+9bs3Aq2F5Ev9WaopTrZJ
	4k4nf+RztNHy/4NOkloZ1V96E+ZRnvD9ij569QTUoFIL+tBlKQ/v/H3LGCPCJ8LoRQ39J8JsE962c
	HnacTrCBlEaxTo6xG1HVn8NgYH8yUqy2SSlCyMBWcD6CVOpLteFL+OBNTMgKwiLnFY7QTeJgS4bzf
	MhJ+UEFstBhLwWXjmrwQ5sn5zx/qVuP5t6+LpPlAg/hKJOtzc00Zyt1hSnecW5TFFuyUJLk7wI65L
	sOjGERCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbnm-00000000DGs-1M4y;
	Thu, 14 Aug 2025 17:31:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma4E-0000000HVdn-34LS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755186037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaSYWXyGxJ/9XhopS6Hw1gTGGNBA7I4gi0bSsDYE9rU=;
	b=ZIslLW6Z+li92ax9j5onLuvCWLQ9e6+FSQsM0wB/0CHFn2bQor7AUojMicpfbukAQAQWxu
	lrX9s9uZxuIwPmEGS95h5J1ffTRMV0z7xAmi1voGpExbYLHbTRGBIAQBR+VeX2B7zFx5O3
	B2EfJwJe3yoARj9RAfykTYD2hDbKMtM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-bVsZNB8WOR-YIP5RkFlIow-1; Thu, 14 Aug 2025 11:40:31 -0400
X-MC-Unique: bVsZNB8WOR-YIP5RkFlIow-1
X-Mimecast-MFC-AGG-ID: bVsZNB8WOR-YIP5RkFlIow_1755186030
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so5224625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 08:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186030; x=1755790830;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaSYWXyGxJ/9XhopS6Hw1gTGGNBA7I4gi0bSsDYE9rU=;
        b=nYyV1oVt4/ZftmbCHQwYf8rsTOkO9Q0c9lAWiCducd0UK+dhGA3AZvmCbugGETwgE6
         4Gy4EOSeuJ0Zx1uHQmtl7DmS5ESZ0X+kLg3qYoCBSnV8pr0X6SK1sd7Ek6dCkX6X8jYY
         PlQGNCIwd7ML/+H1u5/rbuUW5KFJHutoYkVkbLZosvPHgk/6y12PVwCY0fpsYVLR2kK1
         oIzrZWHvQSWPDhMKg3IudQk4KLfBDt3Gatppn1XQkbEvgmRXNHOS/K4i3/74UsidvCuy
         I4e+geAbEvrymLgOnFoSy9V49gNCUshhRRf7hRJyMbEiTRuPgVj+j6/h+dcSdQk3MSn+
         DUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPuanbX8Eilg5iizPkIIjDGnqNoCZSd1OcjbFdXaS2kCcKzaTeK/21frWS22tCV4WurkPW7PXnPCaFIej4g7ix@lists.infradead.org
X-Gm-Message-State: AOJu0YwAEIhlO4Tr/uyAMzmuT1WXd6tSYEt3UgGlE1sK21XeGSFAfa4y
	bBf0fR2K4QUUs4UxB/Nvao9dtkWVXmLR3Pjbsjfwtnsx+JIOyF7MaNygDLkSp/CBCC3UI7DjrP1
	Op0aopVYWa0rBZt+UU3bpTFwxoOr1w/q1XcX8fCuKw6HEv38ODsKEqz2c3kNOQSMa6haFv7Ue9C
	xK
X-Gm-Gg: ASbGncsqguR/x1hE5iofEIkcZmvdTsudmuxu6Ro7B4f2E/0WKMcL9UTdhaE+G1ZbGlQ
	my583x/8mpCsnc+H9ITWcqbZXmRAoXQCSiKzDKNAS960afWG9NCM5iw7SP6nlgBLIK2Njwd7F7P
	QUC9JBHRUJ2fGf7GIEYuZ25oeHpbXKkCoYeXzx0922U6TFh+cTVu/qNdtYBja3llGkxi4TsOjCt
	X9qunphMEAn+tgc/No4Z1B/etSijY6wM1Z6pR3GAhwxNEl7tjHSUikOoIci6PNC3XLPrL1dmXLP
	6f/IkYxTQGGnhdhnCBy5j2rH/8MhEZgsPt0Lx0voLUEjqNHB6tU8APrwo4C1+/jJo2VEOc3DBb2
	g03XfKWRD+lg=
X-Received: by 2002:a05:600c:1390:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45a1b60f926mr33912875e9.13.1755186030041;
        Thu, 14 Aug 2025 08:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO8j0bl06t8kLqVusdd2gtWRvt7hDatkEzclPmxcaIlT06nd+NntfwSiemJ8UjNqI6qlg2+Q==
X-Received: by 2002:a05:600c:1390:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45a1b60f926mr33912485e9.13.1755186029551;
        Thu, 14 Aug 2025 08:40:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1fe2c019sm5608825e9.17.2025.08.14.08.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:40:28 -0700 (PDT)
Message-ID: <c25f924f-a66b-47cc-819d-5ed241a4bac6@redhat.com>
Date: Thu, 14 Aug 2025 17:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Virtio networking issues on v6.17-rc1
From: Paolo Abeni <pabeni@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <aJycJvs3xztfD5Rm@pluto> <aJzU1JsV5we-QqgQ@pluto>
 <aa46dd09-a450-4633-a647-b04781599c87@redhat.com> <aJz1_HzPsEyvY6HN@pluto>
 <146fd5f7-c694-4606-afa5-522c5c05d9ff@redhat.com>
In-Reply-To: <146fd5f7-c694-4606-afa5-522c5c05d9ff@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TbgNuzya_tGBxPo_tDdj6gjRg__iSqIAmAlNYriLVqs_1755186030
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_084038_843284_60449E9F 
X-CRM114-Status: UNSURE (   6.99  )
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

On 8/13/25 10:41 PM, Paolo Abeni wrote:
> Thanks for the detailed reproduction steps.

They definitely helped to reproduce the issue here. It took a little
time because I'm a complete noob WRT kvmtool.

Apparently it was indeed a kvmtool issue.

I just posted a patch that addresses the issue for me:

https://lore.kernel.org/kvm/ed62443b8fd3fef87bd313a54f821cf363f647a5.1755185758.git.pabeni@redhat.com/T/#u

Cheers,

Paolo


