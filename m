Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B3C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXorBDPuo/cRWoXHPASu+eGhuQQ67Aud1Ob620DARGM=; b=Fh9WeuCMlPSm5vUx0TxZTBdY9a
	u4t5Dpl/kCUcR2TPUH8tbmQGEIPevY6eOnv4kMdcvPLD/j/JQzQBgEpqhhNipgqHDnX8GACbMv2wh
	UR9mVPNrHE3Z0/cfGuTkcBExmKG4Kd138A6CRelX5ezo1mwW7qwrRWnpgSjzZJvGV78Zr+nwadHut
	H3pdRN3pW0RMKp1RufNlNaKS+twFI8/XuulNbDfL1TZN89ovvWH/tIa7kxj3sYyqOhjzoncyUMUcd
	PrNl8tCLhHPonlZWlmFKiFozIVe2RtuCGENIX6/YaZHwnbphcAkASCPYscjA5/siZya+AnZcCbsMq
	HkIntx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6E5-00000000xRX-1DvB;
	Tue, 04 Aug 2026 03:54:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6E2-00000000xRE-3d46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXorBDPuo/cRWoXHPASu+eGhuQQ67Aud1Ob620DARGM=;
	b=dcysV9m+1RZGrVxAwJcaKC7fINhGWdM02RkyJAsO3v/0YPxi8NysYiq6roQTo5hVgovS2B
	sTp8PXRbF2GZfImKu6BBbsDa+zJnvuDxcXu42FwLbri9GuSZjoTocx2tnrujXVAMqdFJq/
	DQVEz8HwrCNd56tnbJfs3Pgdg+Jl1KU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-P8O8kStLP2K5kT9g_wbPfQ-1; Mon, 03 Aug 2026 23:53:46 -0400
X-MC-Unique: P8O8kStLP2K5kT9g_wbPfQ-1
X-Mimecast-MFC-AGG-ID: P8O8kStLP2K5kT9g_wbPfQ_1785815625
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so5216974a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815625; x=1786420425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXorBDPuo/cRWoXHPASu+eGhuQQ67Aud1Ob620DARGM=;
        b=fTtw321rTQpPcxtWeryg0e97WCnSLEImK8cfA44JWSNzWI9VF5XliY2pIrxADUkhxl
         ibDDeDNqUDvisOepytoxJW3bpOK6CrU35aDGjiSjyv8z1riw3RoX2MQnBqclolZkO5zd
         p8eYFeedMpmZavVXe9OUJFA4U0Rl1f7virfSxLVg0vKlKOptcWKjC6MDgnmpUtrf+pZU
         C9NUUvdIptNlo7T7gxPuU7ZcqhZU0fI/3nHPgelOS4GVG+IHb4fESpUJpR15v9PfqiRV
         VLdkDOT5xNMbs+Bch3LZxv840g8Jo6Jsgmyrg+Pw71k8TsRdzGHOfK2Vb9/0Wenxz+yu
         kWiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt6ycq4f1Bs4Cvls6LcUll5ra4GTfJhrokHrPCc2nnySU+idM/N9IbAXF3seIa/dlqbbxMY1qdyLJiTJ1I+EDU@lists.infradead.org
X-Gm-Message-State: AOJu0YzC03zu5DlMhmg3ywDoI+Ij8HhUWFTgUzSnKQIs+CSD6HNyB5/J
	cmlWVaTw9fRq/6sXYMe9TA2BSxaEQC6knbpSRvOnY+i0I+O8wWo0WxVjwdYGWvKElhhszNiHghI
	nfIwPlzldDD80esJ2J9uvex34l7RAd2oDbhv48XF7o42alAl3x4jG1bVMNrvTV/Dd6dO+PqTW0q
	3b
X-Gm-Gg: AR+sD13rZnGH/dGTJ7pPnLO6DeiUjD0uFcbPTttqcWwdKy8dD0A9uzL4+0Q33GLQbiX
	6mDTNlmnubGAXhMKaoetN4I90GBkGSBRFPEVw8EDdYMmg/kB+vH66I/hyhv9Li0pfb54K0x+JD8
	Dshp+H9XtyLcB/cdIuyVrK+FAu2btduN1NMiXMfo6T8XexduurJgeWlUGRPVlde5cGD8octC+SW
	FXPTVpHGPinMJkbxJjgckRDIRUwF8ziFaCiRTvVvxYl0oIPKN8EM2ZDwczBPrK9fCDaM5Yo42J7
	2fBkVVtJiJsl5uWvb6qB9YdI2embeTSziTjur9Cfg9q6XoJocTbeqJmayLziKqs/MEDK5+UZFHK
	t+KU8JxYaV2DLRkorJhyia8XCuBcc/+0OESlQ0BR7Gk4=
X-Received: by 2002:a05:6a20:93a1:b0:3c3:83e6:c6e2 with SMTP id adf61e73a8af0-3c92a88906bmr12354740637.50.1785815625258;
        Mon, 03 Aug 2026 20:53:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:93a1:b0:3c3:83e6:c6e2 with SMTP id adf61e73a8af0-3c92a88906bmr12354707637.50.1785815624807;
        Mon, 03 Aug 2026 20:53:44 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ea968fsm4426314a12.26.2026.08.03.20.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:53:43 -0700 (PDT)
Message-ID: <69b649b9-b7d0-4ccd-a9b7-105bb432d274@redhat.com>
Date: Tue, 4 Aug 2026 13:53:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm_mpam: propagate MSC access errors for state
 saving function
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-7-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-7-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vN4u7gvRDblgiCKRsSkXLc-DAE2V-BkSCCVJX4TsgF0_1785815625
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_205358_983724_A8BA7D3D 
X-CRM114-Status: UNSURE (   9.83  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


