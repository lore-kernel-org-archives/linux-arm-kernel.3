Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1E2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=; b=AYG21H6KiqAoHgdo5CKgw3zbcb
	0YkMM20BYicd/EENCgQzyr6yij8VPjrBLz473mMwg+dEAeOIH8x+Q9OeUOxbI8Od+3th28A1VwUiX
	KSw0UWXviJEdryQ2EOK8gaYKGARW1I2Zi9ZFNdFzi4/gEoduv6h4+vq0/30SzFIH4A89H4bE37NCo
	/J69G5JOP2R6JCuFyVg8hJvhMRKjJnNHA5yi1FSBKvOoSgkcAOJ8Dznu4zFijxdodf+r3D2RgLXhz
	YCkEkon1/VcpL/7A95fHhgwiPVVFRoanahSRuV0uGGTc7aIdT2dguUhXOmGsOBiT5jiPWPJNgpWDg
	tVbON4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDEY-0000000BL6w-2uf2;
	Thu, 06 Mar 2025 15:34:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCEs-0000000BD7t-2Az6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 14:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741271417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
	b=Exnx43dv+l99gKvHZZyHl+o3Qmi1tbwpMY8LZyFc0HSEdpFpK44DfpwfZ0BQAZIsQZvCML
	jNE//bcVPyKuclyMCMyPdslhMYVvR5lZu++MOxY51ZLrbhByq4HuQzWlgEXK04fazNOFrd
	wqFrjE+dDQj0aOdgc1csjMf3YXw6kko=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-tYbW5N9aOma98QhJK0xLXQ-1; Thu, 06 Mar 2025 09:29:53 -0500
X-MC-Unique: tYbW5N9aOma98QhJK0xLXQ-1
X-Mimecast-MFC-AGG-ID: tYbW5N9aOma98QhJK0xLXQ_1741271392
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso290992f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 06:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741271392; x=1741876192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
        b=KLv4UqdwuqqcKXXGYJUAN4Wipmbm+ReXfjfMG5xiAx+J8nEzi6R0FmhtGbIc0Im58o
         KUEBfYUd4Tiko9iHzUOZWH7XhL3vkDqN7FT1amqmqtGaNeGm90QBDjissJYxKF2CGWQ9
         OmEgfpWyJB0RaPWb0yHWC43bjhzxAqIrn80sLP9xQ93vgdfZDRMMk88W4xzjspN+6Ev1
         1VIaariHr8ox0A104L/Y+5xDwcu1SX0UuansuaXYUYuAxtwzmzDI1/o8LbfNO/WFGQP3
         eSuNUDtapD1l2lJ74UcGiNCY6wmZMMVSc0B6Zr2w/V4C9SddSDqJnqivPBTYxFbqEXIS
         kAuw==
X-Forwarded-Encrypted: i=1; AJvYcCVgG1Ol95ELaVyJrCQRll5yWsoMtilVV1/KzHTdEuDZAQEg1Dh5WGTqTw8oTEX6vM/AWc9accK/+ivyLvyt6R+d@lists.infradead.org
X-Gm-Message-State: AOJu0Yza+i4EvnTvlVdFHpITqv4jtAgaFAT73mwGUAWhMU3DSNNhLzDL
	gzRwOt9220KNXioUHf38sB6uVfQMU6bDn5Hdl4D8w4d8q2SfosVEA6Dt3gq4MPgQTAfE1LCN0dK
	5zhFuF9so/O0FnKQIcBeCmDjHcAZ925YEfhtnBLxBPNnbtS/4/TB+tfHqBUYPWkja7ygZoYXM
X-Gm-Gg: ASbGnctw0NTH4N35Jr1BkLUywySPgGBJpZGEgZG8ZlNkIBn25fgxOmnQjx5MGtAyLL2
	VJHxV7D8AtgBGnDsTdeucwEpwGg4Sv2KFbQxQUxWZespmfF1KMd2mUy+84w+99zotxg2LDUZQML
	IHdwxh1WpwMQHoe5du5nmHtTDPGQ/7+/b1y0pLZ3vZYyvIxzPA3D/ScIKMjuh4VMloiVMHoQ6kY
	geKg3DTaJA4P1N71Mp4lOG4qNc0MEGSxW+UDJpS3pgC0cGYA6mG00aAI4DW+XLH0vNx/THtfuvb
	vX+/jfusSeX5p7PXX+bxr+nUzjayoHUn6Edao1tGdlrwEQ==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755628f8f.18.1741271391436;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmNrvNwgj8JP10FUTkFjkayzhqglMLbK2EPOM2dy9cPE1fLkIBgeqVz0hx1d6bSuhoE5j+XQ==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755608f8f.18.1741271391040;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102e01sm2234126f8f.93.2025.03.06.06.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:29:50 -0800 (PST)
Message-ID: <03492277-b7e8-4cd1-b92e-699ee0d7dc85@redhat.com>
Date: Thu, 6 Mar 2025 15:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250304072201.1332603-1-wei.fang@nxp.com>
 <20250304072201.1332603-5-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250304072201.1332603-5-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tgTa-9GwCkYhncdMhV3pXNfbNphMJ7SwRgC9mwHKNHs_1741271392
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063018_646688_6868C968 
X-CRM114-Status: GOOD (  10.11  )
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

On 3/4/25 8:21 AM, Wei Fang wrote:
> +static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
> +					       struct enetc_mac_addr *mac,
> +					       int mac_cnt)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	int i;
> +
> +	for (i = 0; i < mac_cnt; i++) {
> +		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
> +		if (entry) {
> +			entry->si_bitmap &= ~si_bit;
> +			if (!entry->si_bitmap) {


Minor nit: here and elsewhere you could reduce the level of indentation
restructoring the code as:

		if (!entry)
			continue;

		entry->si_bitmap &= ~si_bit;
		if (entry->si_bitmap)
			continue;
/P


