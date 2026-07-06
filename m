Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EB2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=; b=vdCbYlY+MRicusiAzAE6G1grtu
	n+hwD6FL43kVh6Qu8oXgqhDb/0e+fvdfGL51qOms9jHOoXG8TaghcKH/U6xDFXdvbhhiVKypEBrSK
	XjJGxQrdVVdUzAMwL3RFcT8Q7sk81ET6b+g1MggqLLrv0J8ORyebv4iNswOrDsy4Qp8JBEpQ4dwqt
	zJn7K7Y8crUtf2TrgN4D+/EcIJbSbFR8ooVxFiBx0s+gPBU4GZHK4VcFld1In2g6zmj6GwTf6odKr
	BmLoffCekn8dRTrmUDPNwYher0q1pUb9UmeTwNIk7XrtYLfS5Ha1Cm7kjEnjHXjqcAknEZGcU7UVE
	Bth0sUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSi-0000000CbzF-0GCn;
	Mon, 06 Jul 2026 13:34:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSf-0000000Cbxp-2bgV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783344852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
	b=UgHDiD5+p4jHRHz3loAVDv53c6P0U518zV9K8JGqJVjs0UM7nwGPiS17Hv0qSkm19KaLsj
	ZPjMGmt8ImcLu4iujXfp1sDN6BsPByMMf2pmRdhfX5D1EMUBua5WSBAlWd+giaJ1nsVmfP
	jU/d41P2LEzkcfU/izyQvpLhmXIAxPQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-lkJ8xpvCMGeVsPPggaEpIw-1; Mon, 06 Jul 2026 09:34:09 -0400
X-MC-Unique: lkJ8xpvCMGeVsPPggaEpIw-1
X-Mimecast-MFC-AGG-ID: lkJ8xpvCMGeVsPPggaEpIw_1783344848
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493d742c668so11819675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344848; x=1783949648;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
        b=dZi5ZWQF7isO437GAeJv9/RIRTN7tUbI8HeeXvHhHconRjOPWdv7J3SCtgTJPJPyBl
         uCvQOghgtxxL4lMICKrS0T9YpK+mxXwCyDH9C3SfUbX6aEbuFdusRqlI6KFib0detFZX
         ODzwbyt0XKQ6Lhas88YAZd5OJnPhA2alu0qJFotHP73xEoID81XHrUYuv3BYum6dIvqG
         DePDtb5DDgyGZ6mpHBL93+22hSdi+ClZDjvDceqei0zQEiScuWmJqdEdPpurQ7evslpI
         MU8OQ/mrK9eamVSFFVW05pfTX2RC2UZX87+u1lPAM0hD6ZY29w4osm/Dm1ljpzy2j8o4
         JI8w==
X-Forwarded-Encrypted: i=1; AHgh+RpNMmXyrK6yH25w6/cg2QMqq9WBslUIuN/+tskNIbFmIjLD9MDIyanlPZAyyWIN/UICx2nI3+kzhInHlgj1igez@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNEozpdlnbV1jK94qKmI4QPOVasMK8pdGrrqt27xmI6el5AVe
	CaDLk9w3PIWxHwcrpju99xf9qIVKIbP+XZJ/aHXLSWLqEqfvhl3RfgXdDUlbyjwokteYNkbiOmJ
	Ab2/E39WrJmeXDtj6Xyme8eer2j3fHvxv1+KpbuoqG6kSiZ7aiNJMvSuOG8RuoPRYq8CiQpb06S
	ud
X-Gm-Gg: AfdE7clYc12VNZ+MWeFBSTuUcB3+Mzuu/LRzExnr1dLqTctfUTBqEEPZiK1kMy4oQ+1
	fOfBS/KwD4rLqeID2YdLV2KmweiBTMCDE59ijpb8wH5t/Z6o0YpiIkjuDNrezMkVuhq1gUVAyNt
	UEqVaL5rjK6uSDjWwuhNje/6Wiqh0BtcFSUpbsvQKYXHjaG6z+xU6IjValwcEV1ZKJVYXppZ7wQ
	nmyxbHsGJa4qmBxuxVXTQoRBq/72YgSVvS5QV4H6ZUS/FCFErLBZvpVVqQSXlqza4Xrf4pcHEzY
	481XlFuat6L2viHjIyNUb757WdEdGOXpCQSO+lRtxmsYng2p5W6p++acgklNZxCVckYSMvPuQrs
	1VJ40HdHFzHk7a5PY8heiaTrj3t3kO5Eyox3AujDLpy1HZOmg30dAPL7fEhljGBPJJGvQoePvr6
	+aX0ZWnjc3oWHM
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5699495e9.26.1783344847676;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5698905e9.26.1783344847212;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm357583515e9.2.2026.07.06.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:34:06 -0700 (PDT)
Message-ID: <b95dda96-ee50-449c-9d23-3de490d3ab1f@redhat.com>
Date: Mon, 6 Jul 2026 15:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
 <20260706-confess-dagger-e60b5fad57e8@spud>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260706-confess-dagger-e60b5fad57e8@spud>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yeh8FJRK16nRajamlIi58E0nVMWRf3-TthAjrbIQ9ME_1783344848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_063413_734284_E76E79CC 
X-CRM114-Status: GOOD (  15.55  )
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

On 7/6/26 3:21 PM, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
>> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
>>> From: Zhi Li <lizhi2@eswincomputing.com>
>>>
>>> Enable the on-board Gigabit Ethernet controller on the
>>> HiFive Premier P550 development board.
>>>
>>> This patch is included only to provide the DTS context for reviewing the
>>> binding and driver changes in this series.
>>>
>>> The upstream DTS series will be submitted separately after the binding
>>> and driver changes are finalized.
>>>
>>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>>
>> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
>> PW, but I think it needs explicit acks from relevant SMEs. Could you
>> please have a look?
> 
> We do not typical provide tags from dts patches, but that's irrelevant
> for you, because this (and effectively all other dts) patch(es) should
> not go through the net tree to begin with.
> Instead, the platform maintainers should review and/or apply it.
> 
> Additionally, it seems the contributor's commit message suggests
> that they didn't intend this patch to be applied at all?

Thanks for the head-up.

I noticed a bit too late that part of the discussion about this patch
did not land on the netdev ML; a new revision is expected.

/P


