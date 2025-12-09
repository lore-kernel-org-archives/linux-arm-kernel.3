Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F36ED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0DgPHEzxlHGmifz9cOEe5whB5mQTy6ubCPYxMJVQns=; b=e7SkaFZ6w0pRTKkafVOyH7xFba
	JbdyOjCYTF20dHcHRXMIh7lePMf3Ull5BF0zpgNWkE5L/onrUElj8Uy/JPmW+r9uRDZt+VPGTAnb+
	xt6U+bEZlzWVABN0+KcqzXf35JnMy7+lZVMlY/hidYmHC3xB/pYDywgGFAgjd/ehj5A+eqL/eTEbD
	WOR1srbmw4URngOiTUaBRL7EuWA8+Tfw9MisvlSabyRImkxif01/SH1EauSQAuOJwHoW9pibvc2/k
	5DfEWGEKoGm2AKyRUnROzu9Bp/X9sNnAMg+hqabYo/wScg8CdBR+84673kVuavGq2SETJ17TwOXV0
	vv/dQVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStjZ-0000000E1wz-3Rsj;
	Tue, 09 Dec 2025 09:10:13 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStjV-0000000E1vz-062C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:10:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X0DgPHEzxlHGmifz9cOEe5whB5mQTy6ubCPYxMJVQns=;
	b=NBxixmqPgMfPWQKBY/M9QuWHpss92s1JvpTu813Vvc8DMwXS0xQcnQ8iekHy6Wf6RM2euCeSI
	TqUCL72OS1OS/RvhVv3zlQLnvfCzxmC4J1+Ff6KeOCZi4n0mLmSPOFN99MqVtne/NzmE25QsdAt
	i5D2k58259kT0LK3h1wmzDE=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dQY0F2cxvz12LDc;
	Tue,  9 Dec 2025 17:07:41 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id AC14E18047C;
	Tue,  9 Dec 2025 17:09:59 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 17:09:59 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Tue, 9 Dec 2025 17:09:38 +0800
Message-ID: <20251209090938.65859-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTfk7Am4pg1tTeYZ@shell.armlinux.org.uk>
References: <aTfk7Am4pg1tTeYZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_011009_647752_55FC7C63 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, 9 Dec 2025 08:59:24 +0000, Russell King wrote:
> On Tue, Dec 09, 2025 at 04:56:27PM +0800, Xie Yuanbin wrote:
>> Hi, Russell!
>>
>> TL; DR:
>> patch1 and patch2 with compilation error fixed:
>>
>> Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>
>>
>> patch3:
>> The simple test case passed, but the syzkaller test (the original
>> scenario that triggered the branch predictor issue) is still running.
>> The syzkaller test is better to run for a day.
>>
>> All patches with compilation error fixed:
>>
>> Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
>
> To avoid any confusion, does this include my preferred fix that I sent
> or your change?
>
> Thanks.

I am using my change, which is detailed in the last email, because you
send your preferred fix just 10 mins ago.

Also, I do the test with Liyuan's patch as "suffix" patch, as mentioned
in the previous email.

