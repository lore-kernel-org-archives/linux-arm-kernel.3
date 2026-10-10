Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B327CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 01:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxjhuLW8bicssN0QGk4iHUCA7gR7h2LYV43TTRknoWY=; b=OJws4O4dRtJZ85GqrHT1oYNLmD
	R+lms1Y8JWUrsah1klsJ61+TBLt8uP+6SnZDff9979mJ73D4uW/I/+0VMjrpHIYa+X1Aeedu0Jh/r
	SZcQpLDl6NXnv2muokH2JHn55QqNYa+tDhFoCD+f6d4Kbtzv/Qlk5afBeWwvc6uHNizAQB6ebZp/k
	Bwt3eGWvTN0/v1h+LG3KvIw/oKyrP1o/Ztl7dY26EoA1LSSDBB/QUn2ACs9dydW54v36R8DHcdzdz
	2wfl1vYcG9zsq06s2vcK/e3st5K6vIY/NNnHDlECP1rqs1eVVyhBAL43JayMKcgNdC1T7Ck4PMXkT
	2/KfJ9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMKP-00000007P5R-2jNS;
	Sat, 10 Oct 2026 01:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMKM-00000007P4p-3Ypt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 01:56:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKZYh2348621
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 01:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KxjhuLW8bicssN0QGk4iHUCA
	7gR7h2LYV43TTRknoWY=; b=HgwlBGMYYXTInqbf/JgR8awbJxjpcG72EdTNY5r1
	FaL6qROAgg/isI5cSzisf69EUvycd2o7emB468DOXPauP2SH3m9CdfW4PhKsrqRC
	IRlOpZj0TQxIhYbzKuN8+l/XsEEEeMnJmdQFC+iy9y82hUBcXWbHN6JIexpaUgux
	ketI6/yWQi5uZ8Ig/ZlLRa2gTlsycLD1/UNTWkTH+bQMbhRIIy/97OY2bgtHrBqD
	XD/TudvuUhaYSIDKpyRHlnm662YYt4yDNBJ3AJRCn4NvNTsWLBWzBexyiIulWF3G
	8/h9EJMeDSHUl5GnapYwJ/8gobhIXgcjksvvhmvadCcvvQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t71et7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 01:56:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso447130eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791597405; x=1792202205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxjhuLW8bicssN0QGk4iHUCA7gR7h2LYV43TTRknoWY=;
        b=kJWY0mfIBAaxMDmgAtHyl/msf/8rBojdSbJBCfWN2iwqj2aXXOpuxHxC9OTLocbish
         dhjzKPfi5DYnR6NG4H21GgroQqixNskUNoltZvW5yJRDUUJnKlQHzdYoIDNo6TvC7fX3
         S/auX4hpDx6aIFmsxtBgf7dXaSj049qRUqLiilouX28z1p4EI9m9VEgLXojxeCwYfYEk
         UPipTOUO23Gi/hO4878/cm8nrc01satDI2skUmKiscB7F8uHCIrFYWeP6oRI41vBqRew
         ZGSo/rknTFl5wf6q2i1dI093//8uM+sEFarkDautHJMBDrxqqMWViaCp6QtWrK8oNjvW
         ilJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791597405; x=1792202205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxjhuLW8bicssN0QGk4iHUCA7gR7h2LYV43TTRknoWY=;
        b=IJewJ9GwV/NbpJL8h4vwt5PPO6QtnaaSbc454qZukjdj37OWoy1eqX4OMF2Qm3/b/W
         fWduY7HzV1HPd96qw31pclKjiI1vjQpLsyIoQVi0o/DQYqwkzs4Jm+NIe1QHFTBkzNzP
         fSNtWDCZugt+eEx1WqpOXjvHPT/2EOfbVHszuScHv8ak9DaOJpqWnrt6MUedzNL216Rb
         QVBDPnHmavRJDN48nCcnpzvHC2h8FZZ5A+XevmkWOylWyg/4nszoz9hfleZ2F9mPcyy5
         7p/tP/sTFJZTw+KQ9i4bGpYPrbdm83rpVP/0pvLESZSo/mMJ/NbHOJq9G9HK3jyRDYcT
         nkKw==
X-Forwarded-Encrypted: i=1; AKwUvBwO+gDm4iREp60muvTLy1QxB5tl5s/lrJNHrFR9qJNtUqNmS3rNMDJKIOTA5jN0xzwEjdetCayyxTJz8+MGbWA5@lists.infradead.org
X-Gm-Message-State: AFq9FYLrYm5diJeSxigrZY11EPzx7cco/z5vssV+LL5mSKrd5Hh1Iz6J
	eVSaxPbujVpfDyKx3sJxN/zBUeevCnVMctStMFLOxocFTXdPKcg8gT5icGrWs9a+aIQYl3msvFO
	X2YxYRpQ9QPXGhJfrCD2e3YmNE6Y1K0mm/AhR3ZZAPVI8yeWI0HbCv4hfLvbsQKqRjYrCtTdjMJ
	5Kag==
X-Gm-Gg: AYBFou3nxhm+zNHX4j3frGcWGVmfP9Ec+AI0RglAgWMDoxgfz5hNhNXcYzOnY2ObS6p
	Y8St3UoX0wo+Izw+hU/wFR+Ev907tsy/71+2U8cmJvVDKAXfOtBH5DY3uBQ6HpXC/++wUq9knlC
	CCoG2Q3lE4mVil7EAcEJDd2AIx1FXgI5cKUYDItY+LKJeK550h7j3khhpCieH9C46mH07Q18pu3
	Neh32vwEDL3s8QgAKeP7B8jiaeXwtrIdetoIHa6mTKAIXs/Y35290DUfGRRUr+BnaTX8fRLnJu4
	yh4xaogUpcPhGJGJgRXBER1Bpo/0ahxHoi9b5WhKDLNQzInXOVQ3ah1V2QKmQ6E54VuGyHhDdH+
	ObyXq71D9sGfl3ZIZIhBWnj2lga7ff2nciJDsQ+SEQA==
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr6419926eec.16.1791597404886;
        Fri, 09 Oct 2026 18:56:44 -0700 (PDT)
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr6419888eec.16.1791597404305;
        Fri, 09 Oct 2026 18:56:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm12289803eec.0.2026.10.09.18.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:56:43 -0700 (PDT)
Date: Sat, 10 Oct 2026 09:56:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, mohd.anwar@oss.qualcomm.com,
        maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Nord ethernet followup
Message-ID: <asmbVX7U4cgm7XNB@QCOM-aGQu4IUr3Y>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAwNyBTYWx0ZWRfX6HiichwuBMwN
 s2dGSQuykbAyJvVc2exonOuzKOOdKMw03MOXiqyvmMtDKK7uZ51VIPRsrcbb8kgZsKODirluJwk
 v7/kjTUfCAKmLjSPOH78mSF7HE8IMjdUFl7O0xCB9UbIkA21aUZAHtoC6SVlJQjb6Uf2IIZAouI
 E4wJrZNhm7jALneC4ZLZqaaD84ig2bSvQ4OVWXDzRMc4fM21Ervx+1Teuox1NFA1/IEIfU6x24v
 OYFz+aIj7BEdCbvvHA6YBtU0z3TnrLEQKOSTwMwD8HbOTVF4Mrqv/dkjSg26QW9NXQ9rsAw7OQ3
 fOVyvpt4PfhY0K+zsIcDBOPAqR948S1d+SYFhc40HfaX204Wb2bE8fWM5kS6LIDbTnVJwnCG4g5
 v7FXi1HraaiiJaiuF/FIZxzpBJzv2dbEeVwYqCbx77qU4CU00pbZj5aD4fgMyl906u7xJ/3Yk9Q
 qLwT9GnjgWEuM60kETQ==
X-Authority-Analysis: v=2.4 cv=Zt94uN7G c=1 sm=1 tr=0 ts=6ac99b5d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=0v7sVypaBCCyGkb-lEsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAwNyBTYWx0ZWRfX3WW5bSGKTbKn
 cZkAAXe48JoEROBDARpq6ptrGwNzBLW9tG316LURuVRWirAp8NI8hTY/gDWH8qaAaoGq5nULgpm
 NuO2I3bsf0DHiS08oayTfI6QYdRUPo8=
X-Proofpoint-GUID: 8SnCv_Za6c0y0gXcKKwjWQz7JNjENUHu
X-Proofpoint-ORIG-GUID: 8SnCv_Za6c0y0gXcKKwjWQz7JNjENUHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_185646_924607_204097FE 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> This series verifies Mohd Ayaan Anwar's patch set:
> 
>   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [1]
> 
> Tested on both IQ10 RRD and Ride
> 
> The full test branch is available at:
> 
>   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> 
> 
> [1] https://lore.kernel.org/linux-arm-msm/?q=qcom_xpcs_nord_emac

Please do not post a patch series in reply to another. It makes life
harder for thread viewer and b4 tool.

Shawn

