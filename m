Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C96BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHQAQ16iF1LrW7qpG6dldPZy5AL5MMme0Yq8410xqOk=; b=ViKwU0UFo0lDoPs4MuqgMQ4s5l
	j91Qzg4sCWiuECZ/TTmeguJo5iRY2pqKf5qaGFaA1pqM2qYqWjamknj/YNWbAP8HobKv+xou/64qB
	zsh2+3l/4s3dLghsaZWaixaejmZPGpAnN398wfTcuZPg1xs2yflncFlUG0Z4atHW0BZCYVj3ND4tc
	O3aNicVKB7glBivg8pzji3T/j4NcYprCgRB7euspeyqNhgIHPwllD+xQvuLG5LUArZEfA4yRyA8Mf
	7/4gkIA+Fdj5RbVy2tNBIvQ6R3+M+iD//TTsk8UgjCaIqEAcK4OlSJBIhx9AI4KlDcxtyByEXCw57
	ijzZoRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmlv-000000018cQ-0emg;
	Thu, 12 Dec 2024 17:14:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLltI-00000000wDK-0DjN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:18:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7CAE1762;
	Thu, 12 Dec 2024 08:18:43 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AF873F720;
	Thu, 12 Dec 2024 08:18:14 -0800 (PST)
Date: Thu, 12 Dec 2024 16:18:12 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 2/5] arm_mpam: Read
 monitor value with new closid/rmid pair
Message-ID: <Z1sMxKM9o6lAiZGr@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-3-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241207092136.2488426-3-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081816_174976_776A2322 
X-CRM114-Status: GOOD (  14.50  )
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

Hi,

On Sat, Dec 07, 2024 at 05:21:33PM +0800, Zeng Heng wrote:
> The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
> For the new rmid allocation strategy, it will check if there is an
> available rmid of any reqPARTID which belongs to the input closid, not just
> the rmids belonging to the closid.
> 
> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
> expanding the monitoring groups.
> 
> In order to keep the existing resctrl API interface, the rmid contains both
> req_idx and PMG information instead of PMG only under the MPAM driver. The
> req_idx represents the req_idx-th sub-monitoring group under the control
> group. The new rmid would be like:
> 
>     rmid = (req_idx << shift | pmg).
> 
> The mapping relationships between each group's closid/rmid and the
> respective MSCs' intPARTID/reqPARTID/PARTID are illustrated:
> 
> n - Indicates the total number of intPARTIDs
> m - Indicates the number of reqPARTIDs per intPARTID
> 
> P - Partition group (control group)
> M - Monitoring group
> 
> Group closid rmid.req_idx (req)PARTID      MSCs with narrow-partid  MSCs without narrow-partid
> P1    0      -            0                   intPARTID_1              PARTID_1
> M1_1  0      0            0                       ├── reqPARTID_1_1       ├── PARTID_1_1
> M1_2  0      1            0+n                     ├── reqPARTID_1_2       ├── PARTID_1_2
> M1_3  0      2            0+n*2                   ├── reqPARTID_1_3       ├── PARTID_1_3
>  ...                                              ├── ...                 ├── ...
> M1_m  0      (m-1)        0+n*(m-1)               └── reqPARTID_1_m       └── PARTID_1_m
> 
> P2    1      -            1                   intPARTID_2              PARTID_2
> M2_1  1      0            1                       ├── reqPARTID_2_1       ├── PARTID_2_1
> M2_2  1      1            1+n                     ├── reqPARTID_2_2       ├── PARTID_2_2
> M2_3  1      2            1+n*2                   ├── reqPARTID_2_3       ├── PARTID_2_3
>  ...                                              ├── ...                 ├── ...
> M2_m  1      (m-1)        1+n*(m-1)               └── reqPARTID_2_m       └── PARTID_2_m
> 
> Pn    (n-1)  -            (n-1)               intPARTID_n              PARTID_n
> Mn_1  (n-1)  0            (n-1)                   ├── reqPARTID_n_1       ├── PARTID_n_1
> Mn_2  (n-1)  1            (n-1)+n                 ├── reqPARTID_n_2       ├── PARTID_n_2
> Mn_3  (n-1)  2            (n-1)+n*2               ├── reqPARTID_n_3       ├── PARTID_n_3
>  ...                                              ├── ...                 ├── ...
> Mn_m  (n-1)  (m-1)        (n-1)+n*(m-1) = n*m-1   └── reqPARTID_n_m       └── PARTID_n_m
> 
> Based on the example provided, the conversion relationship between
> closid/rmid and (req)PARTID/PMG is:
> 
>     (req)PARTID = (rmid.req_idx * n) + closid,
>     PMG = rmid.pmg.

It seemed more natural to me for the PARTIDs assigned to a particular
CLOSID to be consecutively numbered (see [1]), though it works either
way.

Otherwise, the approach makes sense.

[...]

Cheers
---Dave


[1] [RFC PATCH 4/6] arm_mpam: Introduce flexible CLOSID/RMID translation
https://lore.kernel.org/lkml/20241212154000.330467-5-Dave.Martin@arm.com/

