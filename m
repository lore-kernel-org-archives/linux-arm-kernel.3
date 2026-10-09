Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD2BCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=; b=1lwZg0J9+L8NKdrU3it5HzQVAI
	pNfhUYK8Q5ksq9XPVefSK8w31ChVtpnIZh7MBhDFSg9ftlzTJGVBqrBoQgf3NdgvPjyJpL4qoUwOi
	bmqLKefc5LLVQUqyJBBIC7zZ0afi6khzpt2d2h4ETBCLNl2tp240+LOfNTyw+RWJDuwdaCYYaDq3b
	5Ak9+goKpkMschIH35JlnB8W+sIOWdQxe42PRiHTnYbiqwyeF0Keu/Vy0E396KZewelmNDZ0WyOJ8
	jWrtDQAxHHVBZopng8uIdA8OVSfR67Y1TmmH5QsPmxRaJFN6p2YaouV8tfE9H5Zm0BeTlaj1eOXTE
	ffvlILdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5hp-00000005n18-3wlx;
	Fri, 09 Oct 2026 08:11:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5hk-00000005mzr-3CTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:11:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HPqC3768962
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 08:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=; b=GCogJsH2WLEZ3gf7
	7h9wRYz3J0SDKdw9/2oVf/epv0mHnN0QR7gWAZ+4xiK32zHjBB3fDIsQaiGpzTlj
	hNtEIx2sqaL/5PDb6vUrHZk0hB3mGystxTxXF2lBh9SUHofWUVK583xEmx9ROktI
	LS0zq+0lrcQd9EfuOigI5AmO6v97yAlHPoWWqdpLJPd4oNa7yg3a9SfX4fu5lkG4
	yUkMLSBBtVWXfwkf1XFUkl4P7nhaTxrAhF4GAHHRyMpiDldrEkbHNNEmZ2DDGZ3q
	4yAfN9RK8i++0aGltT0/klmquKWbq1zk+Pq0QU8yt3ZEQK7xUYO5IXOiUSGraUnT
	xU3lVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2kju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 08:11:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so1217087285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533507; x=1792138307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=;
        b=VKhVHc5bnb2oZIJnCIFJFdl8dZwyenSbl9RNg/AZA4v+wBurWR7IbdAaeDEcpG8cvx
         hOPfJWE2i1fBLvgj7sIkiosjJsjiptv2JZ9wzRWs9u6OC64UCAbyio7eEFX1KboY0iVR
         r6J731a1R8m4IXoRTRI3H8+F6vMhzFDQPIqJoWc859nVcRHbs6j0lZZu3c+x1JWg44A9
         3vXcn5kvEpqQYgrsy8hOCe2RGNdFny4FSHr7VIuNZ+/y0pYlGrXV4oVNteZtysJ2eP9K
         DDES9nlAK4F/Fhs5+cFpLqbrj+MgyHzb/Tj5k4fyDio5vOAnj/AvjXeaRr7ydYKjodLS
         6Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533507; x=1792138307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=;
        b=uRtEcmQ3LyCb7b9JHOtaqT9r3bkMMggEzGNZBrHy9/E2IpNvCYzH6cTRFQKBv8X6T2
         1cRbp8GHBIuvwuN/IbVXUPPAorYtbx7v3zebHjx5r0bKS/zt+zNWYXEZWXZ3XhAJ66EQ
         3LQ0kVqXQPyJqTdOR63WfvlrKS4F/vDCyiVfm1ZkMXk6l3nHUokjsPLj8OBaLUwBVqcZ
         0v893A8KVnQKnNYaT/Jbp2b4Aw84U6L9wYpeE2b9C0EmMlHJvG8tbJXef4H1qtrVTzt+
         6+qDRfvtjpZoQEL9MkFRrDmCIuKlY1TxmdyAdCYX6ydMFsIqMjgyCMF0IAdiZU140LmQ
         +pjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT0w8pWcjTJqodFfUQq1rXjjd4Ah+6yhs1+apoKSOS/pMSwz9sXbGTNkFgoEk6XgHxn2FGMLYNv/GW3I7OVY9V@lists.infradead.org
X-Gm-Message-State: AFuF++mm8cD0mLS/XQ3lTI+7l9xesbCst0nrqnRpxUpbOQHZ5F6o/xpt
	EcjPA/Z4h/9aqO9C1IUlINT1hXwdlG/mnE8QiQddWSDX6JFXwPIAafLXetqpTUNj00GSoEeKlXJ
	iRqvRV+REOZGOpL3Kq3r5oXgsD61zcsTgjCIdOBb0nhung2T/VKWnhxt9tb+MQgbk1OeEZWsFli
	oacQ==
X-Gm-Gg: AYBFou0DmTtUcKILO8aQWzG71sepljdtA56+9QmJFvLCQY6FvBzC9bYv9QtBEpDvvWc
	gkmOapHWK1t1Q33A6AFpWUvRRFbDjGXhGlzOnTsZ5vmB612m5bRvk/RP2ULtITA+z+Nm5R6LZWz
	hInQcb1c1Y/MsQCtp4Ltd0xVFMlqt0aIoxszb1B72wh81aeLaBZcVHI1gN0EgFuKN9c+H6CjPjt
	Qwi+D2EmT4QnLBZ54KVEFXWxOXcbryvDXgAPke92kIrH9/qWadtP6CuHfuH5bKAZegZ/42uIi1V
	tgjIQ/apXDmbVFi711hN+K8jwXzk9tjqNM+TzaDd+lYlRZWikDwaJzsfsNTJPEV1JO/i4hyseOD
	tzXGDvv6AGZ90a20PNnIX5G57RnM=
X-Received: by 2002:a05:620a:4115:b0:93e:6c02:d181 with SMTP id af79cd13be357-93ebd1e23aamr162091585a.14.1791533507100;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:93e:6c02:d181 with SMTP id af79cd13be357-93ebd1e23aamr162088785a.14.1791533506490;
        Fri, 09 Oct 2026 01:11:46 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, bmasney@redhat.com, festevam@gmail.com,
        imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        shawnguo@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
Date: Fri,  9 Oct 2026 11:11:35 +0300
Message-ID: <179153345648.1914323.15178647656208865959.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055631.1730231-1-vulab@iscas.ac.cn>
References: <20260915055631.1730231-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX78VsvllcLecR
 E+4MH+HHLUr+pYaBiD2zuqlhk7TDenV4CDBgFiMhci8lnjBWsmaMtKrJ145oL+D7kqm53ud7aaZ
 lAGATrvKydFSlbhLRPLFfe/CCO3zfRpnzCAnz3bVNtdtuwJ8dRocf2LDt08VtceVlyCiulx4Xfn
 hanIxLFkqePRP1hk5JnUhkbFFx06SoTvb22E06TYcxO4UgkbxboqJeWd2b3Dmc5xe8+//YE8cjl
 P/KIsecJRJfGviTePEjpdZ0pF49h/L1UEEQBOtjnDyDMX6GnebKCt8Gqcmhz5Ui7gBCINQN5ELv
 9Ff3LCm7aREbjB/vqQJeFADieoham0i1x6BPrDYwZ5UHzOBzRgtR/FbVL2OBq24twEBJbb/BPIW
 edqb0lG8JwdTNQqK3uOr0fLLH1BtV8AGlmX4JLn9dDyZkJYRNSB7VBrehpiYoyolp4zDnBS6y7E
 /6fdZ7zs2Hw8Hr0r6BA==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8a1c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7W_6zTuqtRk8UThwdy0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: k8MmWHnZJJX-AAStLh7qdpNLrdX2tkwY
X-Proofpoint-ORIG-GUID: k8MmWHnZJJX-AAStLh7qdpNLrdX2tkwY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX1G+aDwg+B6kQ
 H35jXOt9fh6FzwUVKpGbBESxUs3Sd4ZfQjSbpeuiUFozArNcvbSH22SWXCAPguuHbFwTXfSZddO
 97m9n8jxKSX0RuwxL+sPIWIeznglMo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_011148_915059_D6C930EF 
X-CRM114-Status: GOOD (  10.36  )
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


On Tue, 15 Sep 2026 05:56:31 +0000, Wentao Liang wrote:
> imx_obtain_fixed_clock_hw() obtains the clock through
> imx_obtain_fixed_clock_from_dt(), which creates a consumer reference
> via of_clk_get_from_provider(). The reference is discarded right after
> __clk_get_hw() returns the hardware pointer, leaking it.
> 
> Keep the imx_clk_fixed() fallback unchanged and drop the DT-obtained
> consumer reference with clk_put() once the hardware pointer has been
> extracted.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
      commit: 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

