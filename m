Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E74ED12685
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDVspZ71dq5KAcHVIgTOcoCEUMJxMrE5sWF08fN2h6M=; b=kTvrjgbXJLJWowamMf75O7ajQK
	MOucOL9AlEOzxHZuhueOWGktHjEkTlfg3Uc4B3JFxWyLgZuYTaW+kn8ULneaMWBAFAYYUpAWvGgnf
	LeC+/x8YhjDVSOzs9gI6Rm+vl8aCLiaHkZYDU/HZMvbVQuzUvs5jjRf8agpQ/z5pizu5DwECyK6X2
	fm96KllhD2g+1itb2X0/wmWCiDlAIoN6UHK3svaqGuuRXMSxfogP/98NOHU8V9F50AiDOQAXRTU99
	PlEeXrgOeoOYkExLRR1jbWpgRZw4b5dKhAzsq6mK/ks883oY3SGcTYgBhXPxL5DOrUGJetcESCswo
	QwucgjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HYI-0000000GouZ-3PM4;
	Tue, 05 Nov 2024 11:16:50 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HWZ-0000000GoTH-0yyc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 11:15:04 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A5BEoLO077893;
	Tue, 5 Nov 2024 05:14:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730805290;
	bh=IDVspZ71dq5KAcHVIgTOcoCEUMJxMrE5sWF08fN2h6M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fma2B8rFAMihl8HSEt6dH/hwvCAhjtKL0pZxJ6P6Sd/SiSnxOMvQ4lwG3q8vaz188
	 cUNIcr3/59gJcDG263VwRYIO5DeI79gi6YWqz8GFe0gxXlCaV7hJKULF3dmrC0l7Vo
	 6YOKf5LjSguE/EPmarxXMH0JW/nuUBbdx9LkotI0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A5BEoHX052462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 05:14:50 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 05:14:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 05:14:50 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A5BEhKc094758;
	Tue, 5 Nov 2024 05:14:44 -0600
Message-ID: <9dbaae62-fc18-4f87-a6a9-8226e7266473@ti.com>
Date: Tue, 5 Nov 2024 16:44:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/4] selftests: hsr: Add test for VLAN
To: Paolo Abeni <pabeni@redhat.com>, <geliang@kernel.org>,
        <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>, <jiri@resnulli.us>,
        <n.zhandarovich@fintech.ru>, <aleksander.lobakin@intel.com>,
        <lukma@denx.de>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <shuah@kernel.org>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <m-malladi@ti.com>
References: <20241024103056.3201071-1-danishanwar@ti.com>
 <20241024103056.3201071-5-danishanwar@ti.com>
 <3e443eb4-d15f-45ff-8b41-a8215fb4032b@redhat.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <3e443eb4-d15f-45ff-8b41-a8215fb4032b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_031503_446953_6267218B 
X-CRM114-Status: GOOD (  12.31  )
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



On 31/10/24 8:11 pm, Paolo Abeni wrote:
> On 10/24/24 12:30, MD Danish Anwar wrote:
>> @@ -183,9 +232,21 @@ trap cleanup_all_ns EXIT
>>  setup_hsr_interfaces 0
>>  do_complete_ping_test
>>  
>> +# Run VLAN Test
>> +if $vlan; then
>> +	setup_vlan_interfaces
>> +	hsr_vlan_ping
>> +fi
>> +
>>  setup_ns ns1 ns2 ns3
>>  
>>  setup_hsr_interfaces 1
>>  do_complete_ping_test
>>  
>> +# Run VLAN Test
>> +if $vlan; then
>> +	setup_vlan_interfaces
>> +	hsr_vlan_ping
>> +fi
> 
> The new tests should be enabled by default. Indeed ideally the test
> script should be able to run successfully on kernel not supporting such
> feature; you could cope with that looking for the hsr exposed feature
> and skipping the vlan test when the relevant feature is not present.
> 

Sure Paolo, I will make the new tests enabled by default. During the
test I will check the exposed feature `ethtool -k hsr1 | grep
"vlan-challenged"` and if vlan is not supported, skip the vlan test.

Below will be my API to run VLAN tests,

run_vlan_tests() {
	vlan_challenged_hsr1=$(ip net exec "$ns1" ethtool -k hsr1 | grep
"vlan-challenged" | awk '{print $2}')
	vlan_challenged_hsr2=$(ip net exec "$ns1" ethtool -k hsr2 | grep
"vlan-challenged" | awk '{print $2}')
	vlan_challenged_hsr3=$(ip net exec "$ns1" ethtool -k hsr3 | grep
"vlan-challenged" | awk '{print $2}')

	if [[ "$vlan_challenged_hsr1" = "off" || "$vlan_challenged_hsr2" =
"off" || "$vlan_challenged_hsr3" = "off" ]]; then
		setup_vlan_interfaces
		hsr_vlan_ping
	else
		echo "INFO: Not Running VLAN tests as the device does not support VLAN"
	fi
}

I will call this function after the ping test.
Let me know if this looks okay to you.

Thanks for the review.

> Cheers,
> 
> Paolo
> 

-- 
Thanks and Regards,
Danish

