Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC06CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=; b=FjuYBMc4umYWciqo/KqegHtoQ6
	XB5VhDplEaZTOabU/3f1J3wi8yrUchqPAtGclakpbzeYYfl+Z0+CtXRK5fDnAjhNaaOWb2MXKK1cw
	VODvpv1o0YznTHhqcK88a1kAC8xiUymC9L9gWe5t5oof1aI2t6mTy4GIRuRIFcR2u1jc8QWTgxrUB
	vQis17H1BN7zHFyArwU8rwrWO2nt+IjWRlavfVLBcaT161ihHznXZJTSCjctWEsdudEewuSyi5IHn
	1Te1SEGSezdl7K1rhAgR49KkiazycG7igZN1myH5jinYM8xuOfbGeV+13aEXHFinvZ3SnjJ/TAS/7
	oivVLv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ron-0000000CHAN-1SdQ;
	Thu, 24 Sep 2026 22:21:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rok-0000000CHA3-0JBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:21:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIeHFn2303726
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=; b=TD1QmSIsY7flrZU+
	7SOZfi9DGtLHZLT1J/4vljwLS3y4Vc5MqJt9Bolvn2w9gHE1e0TpyIF8VlEsUSe/
	yRhU2I0n6IbDCnS7WGGtVIgtPF1oYXyoZ1IGFUTBw1kooNgCiEYQeGPDMMN/fRlK
	aOXmWUQTkg1D0hwp+mbcHi11Sw9mIDXJxuTFFjXWANqW3udlW0BoaIe0tKO6f68t
	IweHYAkTZKoNHSI/iz6P1aEZqsYa6483W3jks7U89wmAgYCg2ngqAnJcpf4bMCjd
	TsvRrWKvXvHUWoa5/nCYjkFZQX+tAZUQdIXRj0DQTZJTJBL3LkirzsPWxjfA9LJN
	H3G9VA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7tv8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:21:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14383177746so727242c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790288484; x=1790893284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=;
        b=bQBG6MIVqEyqQt2jZaHavP/V8LbFlbfuNKf2ygH+edFILAdx4QH7ewv3atr5kGhgjK
         rtW9pqg3OuEiyZzpeTt4skMlxeTGLzQ01YaSNheSXjBtXy7u16TzsakUW//6r1C73Zyn
         24lHfVBEn93WMMYNzTRxIAIZX9EunLpL3oQbgXzhIsbOudPLzETvsjmgdKijAFiYmoda
         p9eNRAg+MOTh9DLSOGhiP4EXEodwVp3lwYgqB48msqAbQkQdYw7OsZ2x06Rh4s/KAosz
         P7yrIJQn0fw600ZJkfUJqhQ5qCM6p6uCjEx1VXr92F+dDVoKE7hkY5ONSnN3VLf8W49t
         vAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288484; x=1790893284;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=;
        b=siv+4OFT4SNyYBVSL6WvYQNqOZwdOlthh7gafnIlBwM+EiORba1P8W+8GhXNzElwaY
         bQTAeLWn44ksnkSiMwJvByVJNOFyxS/vLQW5cmZr2u4rY2BboKvqm5aIU9N6W087DMZ6
         2Na8IgHif6zPuhASU3+9RsVyBkiLUOUO58YNPuhuNhzgZULY75rDf+gfX6+App7qJcYy
         dx4+xUh/kUQAlAzAExrAvL/Vym0bTJIMzD/H2G0A3Gxpila+2ge1k+Sawx6r882gcP0f
         xwr6LI3/MxGVd/7m4wYgmbjTYRpsoOciYzQEKAxgrhjItK/xC3vtNCk50fx1tozZPsKb
         Nzkg==
X-Forwarded-Encrypted: i=1; AKwUvByF6AcEfjmE7nXiufCBYrgyqK7b2Sthxu5huHhZJdprMWI4w6rofg7Bb4vtA26LmrZAjVd88oshdW82L3iUn/IK@lists.infradead.org
X-Gm-Message-State: AFuF++kuMQqu+CniT2k4gROwSNmUZog+gnJI+jBJIB+zUCqjuK5vIXse
	+1kHMAkNpSBXdARvdqthXDQQQiUWco96ksBsg0BO8OaZDusptFRKrUPzzLB48sPS5DrzrB5BO6+
	u7ezpMKjDk8AjnVLmIrAFmWAhkrM444RcBPWGrq/iE7osStbyQa8zLq5teX/ua17/MIio5ljFqZ
	rJXw==
X-Gm-Gg: AYBFou1cqGLzhFsjTSLzQ8HLQfF8ET/gajNjNFJei5f/We6rBSq0ESA/u2YyvTtOw3G
	yI868ryt5r3JndJj1UD3NtXeKyGciKvacwfp+Ld5+zlIynTV/gbyAN0ZhMqqwuZZoS4190hwyUx
	6Ed5Uv1p61MzdrE5DNp2x7sf+U1qvOwbLyqeXBnKzNF5PirjjoIVOppouYuBEYRZ/IOW4jEjlRS
	zltV7Pahl4JxLFu1I35JIm3OM+dCrvwvIOTaVTKqG2yfm6c4fmwVFFvrPCoPZA3KFZgMQfFzr4+
	Uc4q+LPKa5r2urkGDF4nVlhMoYty7DHAtuRNHt2VFGyzQYR6vx5lry8Ptdwqa7LzCkhpWd0cC/H
	IiyHIH+gbshcGokIg4f3aAHBP+hDYPjJKSM96ZoPOwUJ/9IAkxilFrQ==
X-Received: by 2002:a05:701b:4214:10b0:144:eb46:c40 with SMTP id a92af1059eb24-14503fa7654mr3140950c88.9.1790288483862;
        Thu, 24 Sep 2026 15:21:23 -0700 (PDT)
X-Received: by 2002:a05:701b:4214:10b0:144:eb46:c40 with SMTP id a92af1059eb24-14503fa7654mr3140902c88.9.1790288482396;
        Thu, 24 Sep 2026 15:21:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm1402048c88.12.2026.09.24.15.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:21:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:18 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 09/13] arm_mpam: propagate MSC access errors in
 mpam_reset_class_locked()
Message-ID: <20260924152118.00001671@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-10-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-10-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 28fCZCMFOYaX4eCVR1NtnXyut4vu3ce8
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5a265 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ESexO8LFGIdw5cpBbeIA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfX71DggJgrfz1I
 qHsYzrlY6qO5AD3h6rYoBHdmSTc56Ef2+9nO0OmLKHIedozH6JiW90+XmWu+EO1vNGzV4odt6kR
 adRdP0LOsw/ggui+Bp7KjIPEYwLrncUF3ALbEa7aYLepO96jJ9XqlvG+loELDWrXZ7Ps3YawzQe
 2bbA1OyvnFPhEKU1UOPbIshDzznPeBr+X2LAoBgrsk219T9BA3+h2QqKw9NOcKlUF8j/0rKC8KZ
 TpRdv0KqGEI2wGiXoHOr53StzFxND/Cyv+GAgYDo3MBmks4B9bL2lUKHlGYisjVNorHKr1oHL29
 oWactn3nale/mQpM6mhllta+IhO+PBelD87IgfhhEWAOQOZ1n8usu0P3PJQzpUs+xLLpwAe2Shv
 KjH9YvXb1JxKuDhCC8mP+mL/zkXxeKB1cjzRU2xAG9s86JhoaGGth2f/iWsa4BhQV/vpBclicCW
 g7dG0ei/HEJbdvxx9pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfXz3CslpCF+I9r
 nTd+ll6KkMFuLqqcN2BcX6vgtZShGT0kbOOedJay+kdRcsByOozQCzLeWQ5mhoMoGZiBDJMR7Ee
 MuqY2w0tayw+FytMfIgduT33qgFfOKw=
X-Proofpoint-ORIG-GUID: 28fCZCMFOYaX4eCVR1NtnXyut4vu3ce8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_152126_254914_573042E0 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, 24 Sep 2026 17:27:35 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The mpam_reset_ris() function can return an error, propagate this up
> through mpam_reset_component_locked() to mpam_reset_class_locked(),
> which is exported. The external caller is a void function, so cannot
> really handle the error at the moment, but at least we report everything
> on the MPAM interface side.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


