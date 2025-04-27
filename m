Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C431C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQSPcZTtwb3AyD/BZAXLpksdXqfkUHT2zq46CYmEdMo=; b=n8c9/MB3NqwgXmhHuvKUPyabaL
	hlzfwaa43MbKxTZ0QXHimCZyxSKE+Q6FokrO6NkXt7jsLWItDnsj0vE8e4FhucYguGsB8iFa91ceJ
	AvxSfeLpH1Tb921TIdgkpiRfI9fXD1t4oEOE5ltSd6WxhSsp7r0cLJIrvRuTE5iM2nu1MvuIIK1Sy
	VE+NjPpzSUXTLSTCA4Dr9UuS5wF2F0vfFMUJ08W6ZNs81ZmJVHWAwip3jy2yo8Yk6QTMMjcBirns/
	PNQvnRKSP3DU86hgIabFHMvOPay3KD9fIfGxVUMPqOUKLqdZusQiYX85C/i9Ox3Ts/F3HVLimDU5/
	T9UgJKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91hc-00000003ZmB-1w7Q;
	Sun, 27 Apr 2025 13:05:48 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91bY-00000003YuM-1lkQ;
	Sun, 27 Apr 2025 12:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=DQSPcZTtwb3AyD/BZAXLpksdXqfkUHT2zq46CYmEdMo=;
	b=W+o3lnqkGrJokPTPdUKgRc8dwTJEGEBZXqXDzpzBAphAGv0S3ucsCC4ciSNyAw
	54nZPdtYvnX8mrIZkIeARrVv6XR6YPeuLTUchZ6CIOc/K3nrrY9ggild7Dg5fJ5o
	a+uwQyRZELgr/MsaeTeo5jAxITNQvaWR0fHQYNyhcuSbY=
Received: from [192.168.142.52] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3lQ4ZKg5onKoZBA--.22488S2;
	Sun, 27 Apr 2025 20:59:08 +0800 (CST)
Message-ID: <40658509-180d-435b-aa1c-663e7536eba2@163.com>
Date: Sun, 27 Apr 2025 20:59:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com,
 shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250423153214.16405-1-18255117159@163.com>
 <yhcnrmmmphqz2egrws5sxobysf6ntnd7xxl5vuzo34y5aunbj5@pe7i352kgdm7>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <yhcnrmmmphqz2egrws5sxobysf6ntnd7xxl5vuzo34y5aunbj5@pe7i352kgdm7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PigvCgC3lQ4ZKg5onKoZBA--.22488S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4fAFykAw45XrWfGF4Uurg_yoW5GFy8pa
	s5Ga93Cr47Jw4xAan2yr1xZFy0g3ZxAF98Zws8Kw1jyay5X3WfXFWS9F1Y9ry7Xr4fKr1I
	vw47Xw1I934Yva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UloGQUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwU8o2gOJqRbegAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_055932_851042_C576809C 
X-CRM114-Status: GOOD (  13.75  )
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



On 2025/4/27 19:10, Manivannan Sadhasivam wrote:
> On Wed, Apr 23, 2025 at 11:32:11PM +0800, Hans Zhang wrote:
>> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
>> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
>> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
>>
>> ---
>> Changes for v3:
>> - Delete the redundant Spaces in the comments of patch 2/3.
>>
>> Changes for v2:
>> - Add register annotations to enhance readability.
>> - Use macro definitions instead of magic numbers.
>>
>> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
>>
>> Bjorn Helgaas:
>> These would be material for a separate patch:
>>
>> - The #defines for register offsets and bits are kind of a mess,
>>    e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
>>    PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
>>    PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
>>    names, and they're not even defined together.
>>
>> - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
>>    PCIE_RDLH_LINK_UP_CHGED, which are in PCIE_CLIENT_INTR_STATUS_MISC.
>>
>> - PCIE_LTSSM_ENABLE_ENHANCE is apparently in PCIE_CLIENT_HOT_RESET_CTRL?
>>    Sure wouldn't guess that from the names or the order of #defines.
>>
>> - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.
>>
>> - Submissions based on the following v5 patches:
>> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
>> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
>> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
> 
>> https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
> 
> Because of *this* dependency, I couldn't apply this series. I'd suggest to
> respin this series avoiding the above mentioned patch and just rebase on top of
> controller/dw-rockchip branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dw-rockchip

Dear Mani,

Thank you very much for your reply and suggestions. I have submitted the 
V4 patch based on the controller/dw-rockchip branch. Please help merge 
it. :)

V4:
https://patchwork.kernel.org/project/linux-pci/cover/20250427125316.99627-1-18255117159@163.com/

Best regards,
Hans


