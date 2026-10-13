Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB4CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XQ5iQnNPR8pVf/sjy9fV4DTar/X6Zhmuz/nTn3PkjgY=; b=3kQjnbKzDM46UX
	tnQSxqsrAUbnrbXybgxyAlhCz6ZZn3kxNJmzRJnOWNgOAhqcUm7agJTk9W+ClJ+kEK3EHpmD/tQYA
	HDuyCX4y+a0jixmY/nZKNM3TiOKiomlpYfhIseNUFpzX91FjjImfHuTcSBSS8yW1QElOpucNTBk35
	RbuP+CB2OZhKiVZpkPJpBOSItKN8MBACRVOkcxNPQNHNfRok1k6267C+5yFNz06/5Ll3luD8pIDoW
	ObifqpJXIPKqSrfFyuLO6MENzZo49vRjkMimWfMVgat4gX18hFwhbU+Oys94CzSI7GiCC719I88vD
	f4iaVKl7r0ud5XPhzezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGy-0000000CUTL-3Fll;
	Tue, 13 Oct 2026 09:58:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGu-0000000CUPr-3bHT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=XQ5iQnNPR8pVf/sjy9fV4DTar/X6Zhmuz/nTn3PkjgY=; b=PoRyt1y/xPi/NVR7EFporAIWX0
	0s+tvePql7u65z/JaJ2K41H1/ex+jY1HS4X+0lkR/5Q9PMi9Dcpr/Uy/L9nlKYGO7+tolknc4NtpE
	Zm1oFdVNPDHQkGSwrNgYKtulcEnQwGueMPIR364SlGFYpraPCZywZzo/6zT3vAZiRSVZ+zXTxjgi5
	CVNHLBk2RzSL5XuNwqQUh/dHN8lhonKjr/ttGhMwwHYU7hOcGsXJPvCb5/glKq6ZxKgC1QMb2vmJf
	T7/9GoTjKkyRzpaGz0m/8Jyw4pui9xOnKQU+o/gopg9xehPzZS/YcQbP53dql4R5LH+gwiydjyfyZ
	/A0faGQA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZGp-0000000FNZ4-3MWf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7Oulx015766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XQ5iQnNPR8pVf/sjy9fV4D
	Tar/X6Zhmuz/nTn3PkjgY=; b=kBd09fqXlbCyANCX5OGy8EHKW1W9sI21EAkaST
	WokDjcM5G/g4MVhPkRQk8OenoT45lCXZEN9XEQ/wFq3TyaVaDtWk98H8OyPoEfqU
	IzGgRt8YBOWz/3LBl2t/LfDZy3Avea/ayxINEFhOAv1enN4EiBIvIE06MbNVGqCb
	JkjKBYgDocG6maqMEYKyIIjzdAS4GlMvDDk6uVmZYtDbPPzjzaxMF3ClGGN/MGgk
	Ks72G9wHbOeWDpNLo6YDQODNcpJxu0V7eDl1V/7DwwI7s0wjRh4HjKEgisUf2GeF
	PDYkJFbdY3PiLNeGLrtYWdgOy4yXbUXJgTor0wOoMhokwwVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugmj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso526904585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885482; x=1792490282; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XQ5iQnNPR8pVf/sjy9fV4DTar/X6Zhmuz/nTn3PkjgY=;
        b=NUbAMozvyq0UzOlJ0ZCSk2H/oU1J+PqxIlFYwi0HKuY1cFsy52hSaVESTMS3tVfoX8
         29zg3AT3+7+XPx5/q8o6msNMq0wYWSgP5YGJny704opIoY+yak8vxNCUCex6Y84ebniU
         3w5o1qEg6TsHsJZCyKz4CJU3fTLOw12X+I7mcfISi0UWs1ays+78TFNVXQdbOWkgwIjo
         Y5xoYJgyu9snK006ulPJPC3GwtcFf0FGEDgKT2o1+mPEzeJ+ncy3hqu9iGXZL/x040rg
         bTcpCxc8crQEJNij/7c4wbyj62KBW78lOT7/PJdhJfbpp2MCZ0RRHD/I193SVC/VmMBp
         Zrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885482; x=1792490282;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQ5iQnNPR8pVf/sjy9fV4DTar/X6Zhmuz/nTn3PkjgY=;
        b=ubqc7kyf4ZFzhQq28HGC7SaKJYEJGxgVvaliSH8i2vTqmyXM3P6mV+Pw8a3NYbm35G
         pfdJBzRJu3/clpGzfu7JFaSG0ZbokpvDCbtBbKMFn4CwYLeiDL4F3eMz71NeP8BjND2f
         xlUvgt9jk+tLM2MvWBOrmXwQhuSb3w2Q5hZwhVjJ9Vev3F0DUi1Guzz8x1uNrMlB8I7P
         lw5LYvpqG4juHyuc3g38VRn5KRWcP775GKEBbMBraK6tGQgUvTyNryZQ4h9rsDnwd3IY
         PEMQ8W58atpG5+k7SE/cnJ0b9sLCGuQGBfJdyxEazvdcYVLm5/puVcrwGjgjiXoNHqsI
         EfSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg1YwsnxI4CcwwI40nm1GEoL6HLWO5dxg62iX6ETOrgXnUcxAax2EBVQ3hLjAQT3408mhEgUzwd51Qv4xb6DMB@lists.infradead.org
X-Gm-Message-State: AFq9FYI2kHuvaiQlujt6UopSZGc5bO95S0A9f93TsipSr2GZNq9h5agJ
	n6HBzXM0qLVAYdjAVsEyXf7n7In7W1YMYQ6jcrpBK4RUpuh8jj+egbM9e+/g4QxfUbMdvqzPdtR
	i0afUlgV+fxYVnuHN0e8zsiuexInTzifsU5TW/ENHNtmb3wB6gVVOgI/+XZkpJoGIVptGAilzMx
	XNyw==
X-Gm-Gg: AYBFou1n/cVdsgu679Twc/AsxFgmRlj6QfWr3rfa1Th6U3ERvmVsuAab8Xb8spTjfvs
	YmzOyFMTFiS2AvLHhZI+ICUn+aVWRp4XG69BeC+6oD79szP3dyyEC3CW1fbYGCgshxu7npV+jLo
	SP18Mf9Ai5tyMyjcM8AKavN4srOT6V4qHJ51iaUB9n2fSMUhMbbffyOkTPVSc4r+E0OysnXhPsK
	8401IztN6OtbaP/DblqvPro/bDBBJ5lvfA9dhWgNzKM+7rh8zWN8DL+8uGJ6z60dcT5XFpWTElC
	43JnIwdsJly2DV0ytv6Dav3X9sUFcn2OhCr+W4a8h3h+OBaE7zERgUUNYpVpEMwPggNMfMH3jQk
	jl3v4ceZgpYmyySfK2l7ULo03/9qv
X-Received: by 2002:a05:620a:19a8:b0:93e:74e5:2b1a with SMTP id af79cd13be357-93ebd0e4407mr1897090185a.10.1791885482352;
        Tue, 13 Oct 2026 02:58:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:93e:74e5:2b1a with SMTP id af79cd13be357-93ebd0e4407mr1897086085a.10.1791885481808;
        Tue, 13 Oct 2026 02:58:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 00/14] crypto: qce - Fix crypto self-test failures
Date: Tue, 13 Oct 2026 11:57:29 +0200
Message-Id: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIoAzmoC/3XSwW7DIAwA0F+pOI8KXMCw0/5j2oECXiO1zRqya
 FPVf59baWoOcEGyBQ8bcxW1TEOp4nVzFVNZhjqMZw60etmIdIjnzyKHzAkBCpxyWslLKpKGH1n
 LkeRc6lylCUCUoVCwVvDBr6nwjof6/sHxYajzOP0+Llngnv3nbItbQCqZU9CadIzZwNtY6/byH
 Y9pPJ22vIi7uuzWEjalHUslJdibXHKi3JHMSgJoSoYlQ54bjahdch3JPiVUrilZlrwj4zSR9hA
 6kltJne7cvSZrES0VSy51JHxKoT3ABVlKeZ8BtY+kTUfyKwl0U/IsaYV2h96FiL3ZhbXUfvHA0
 p4/ABooGCI1pNvt9gc/39s7wgIAAA==
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6324;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=b78OH44dk3W7bznJ8EXqzn2H7m89nwXtdkJrfQuGZq8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCVQL4s5gavr3UglkZwz3d4nnyTokNOrqimg
 Ty1GvfrxXyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AlQAKCRAFnS7L/zaE
 w19VD/9ILs7+O4FP+h4MhIk6OCgKWqh65AiCLsfW0/xLm4Npaz4rQw/S3YCAuLJu0fIR9M/a8nt
 IX3W2nG+U2yfqmXchdAGzKaDkaHh6/vZqL9qXAcwtdr5yEI4iBIA4/H6y7L8fC3t48pvu0eqM48
 meDh/IARIfMfJvGUVlCs7t1TsHdVoFKmOxP6svaRmMszY4iNguw6WX7MRNJ2cGX+g7CmT7t4ADH
 8AGwQHm5w2wkD+O3+lTYqXkrMHbhFsec0UkVDE2tss6nradLRtp/CVG91Vie/oDOvZhjJQyWSP6
 v5VbkAKMfui8DZH3uch6JUTZe0SAIDCmQwkJnv0CjO+Ae020jUbPMz7pPs7Wur2MZuIyZgtxGsu
 87i41GHa4zqpq+eoXsuUKq+K3PELqxJ+pixZWkek1SO1O3+m4di5Vrj9VJk943hZQMAsjNzKfgD
 PmCmLz6MrBV28RtB76Sq0fW0MC12lZEcUFA1JK7GImA6YTygABY/xdvujp//niyOtoTPQEvzHle
 BH+x1Uv/4wPlla2csvvd4QCmVpGUscGowamHaxbRogK9QuAoMALFQMWvP0ga6HQ0rc3H8wv3aIm
 r1heNgox6bPwDzJS5mC3wuqJSmdsRsVkapVJV3NNdmwPfl7WO35Wo7LkR1Zp58F6uXYEbXbCe1v
 pZmVt4rxpdGFa5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX8VIsqQFDUckB
 LhG/8n0qJ+R/gaHlv+Icu2a9TQ0jI3jzKG6OtmbcZhUnYGNRrwHEVOVaB5SbhIT85AL7ghIY3bq
 wRCmt8hUZsmqSYRTo4/mEGhykPTDOj50fw7c3slm36OwDlG1zPHx80nbH6PqSH1+3BeQKNzs2t7
 i+/tBVHFBIZppPdmzYD7dqEF9Dopuq6mBJxf4R7UyYrfwFp/24wlzA2O4DsLXrIwqdJZqPsNQN7
 kw9WyUpTjCP+dx5RYE/CgJfF0U+T5SYXnx+La63/lsRbwAsxvRYDjdZ1WRM5WU7+HHT/6exG5uO
 34CyEPEUXIkGdADkqvXpZu44lEQeUKbY9sHgSz8VIUjzJQmZUE2uAfVveQl9cOFpU7H+TzHOjIa
 6sVrUfjourGNsDU0Uf8yGeKVz2TJbgfenaKCxeQsYO/+c5SbrFI+Dta+lj9GXaW7JQPL49UwgrS
 FpsUtCvYWDIJrDv59lA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace00ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WbXel1EKDWabkshC50YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: IPkZrGCXN2JWWNfxxJG2iXMMfqUAoAzr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX4rP85IBHR+2W
 u8jTyWwcjRSBN+1Rk/SIcAEkW92iJZ3jtst9k9a01IZKQVPNRZe8db64AZUmniwniI2MdbOIE/P
 LR/mb7vnAPWGvc0olVCW2u493O/0hzY=
X-Proofpoint-GUID: IPkZrGCXN2JWWNfxxJG2iXMMfqUAoAzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105808_410476_B52265BA 
X-CRM114-Status: GOOD (  27.35  )
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

This iteration addresses issues raised by sashiko.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Split the QCE driver into a core part necessary to bind to the QCE DT
node and enable runtime power management in order to allow to drop the
interconnect votes, and the crypto part registering the crypto
algorithms. The core module is then enabled in arm64 defconfig while the
crypto part stays disabled by default. In addition: the actual
registration of crypto algos is gated with a module parameter that
default to false.

Note that remaining reported bugs will still be fixed in follow-up
series. This series addresses self-tests and disables the algos by
default.

Merging strategy: patches 1-10 should go through the cryptodev tree and
be backported to stable branches. Patches 11-14 are v7.4 material and
I'll resend them separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (12):
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use fallback for fragmented skcipher payloads
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: enable the Qualcomm Crypto Engine core driver
      arm: multi_v7_defconfig: enable the Qualcomm Crypto Engine core driver

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 arch/arm/configs/multi_v7_defconfig |   1 +
 arch/arm64/configs/defconfig        |   1 +
 drivers/crypto/Kconfig              |  26 +++++----
 drivers/crypto/qce/aead.c           |  44 ++++++++++++---
 drivers/crypto/qce/cipher.h         |   1 +
 drivers/crypto/qce/common.h         |   1 -
 drivers/crypto/qce/core.c           | 107 ++++++++++++++++++------------------
 drivers/crypto/qce/core.h           |   5 +-
 drivers/crypto/qce/sha.c            |  74 ++++++++++++++++++-------
 drivers/crypto/qce/skcipher.c       |  59 +++++++++++++++-----
 drivers/soc/qcom/Kconfig            |  11 ++++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/qce-core.c         |  92 +++++++++++++++++++++++++++++++
 13 files changed, 313 insertions(+), 110 deletions(-)
---
base-commit: 666d66df25253070cb297cb920b0bcfcfe5eb871
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


